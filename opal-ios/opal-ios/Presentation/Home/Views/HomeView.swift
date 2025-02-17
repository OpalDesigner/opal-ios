import SwiftUI
import Amplify

struct HomeView: View {
    @State private var imageName: String = ""
    @State var image: UIImage?
    @State private var errorMessage: String?
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            Spacer()
            OpalText(text: "Find the best models for you", style: .headingOne)
                .frame(maxWidth: .infinity)
            
            OpalTextField(placeholder: "Enter image name", text: $imageName, style: .primary, isSecure: false)
                            .padding(.horizontal)
            
            OpalButton(title: "Download", style: .primary, action: {
                downloadImage(imageName: imageName)
            })
                .padding()
            
            if let image = self.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .padding()
            }
            
            if let errorMessage = errorMessage {
                            Text(errorMessage)
                                .foregroundColor(.red)
                                .padding()
                        }

            Spacer()
            OpalButton(title: "Sign Out", style: .secondary, action: viewModel.signOut)
                .padding(.horizontal)
        }
    }
    
    func ensureImageExtension(_ name: String, format: String) -> String {
        let lowercaseName = name.lowercased()
        return lowercaseName.hasSuffix(".\(format)") ? lowercaseName : "\(lowercaseName).\(format)"
    }
    
    func downloadImage(imageName: String) {
        errorMessage = nil
        let pngName = ensureImageExtension(imageName, format: "png")
        let jpgName = ensureImageExtension(imageName, format: "jpg")
        
        Amplify.Storage.downloadData(key: pngName) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                    self.errorMessage = nil
                }
            case .failure:
                Amplify.Storage.downloadData(key: jpgName) { jpgResult in
                    switch jpgResult {
                    case .success(let data):
                        DispatchQueue.main.async {
                            self.image = UIImage(data: data)
                            self.errorMessage = nil
                        }
                    case .failure:
                        DispatchQueue.main.async {
                            self.errorMessage = "Image '\(imageName)' not found in PNG or JPG format"
                        }
                    }
                }
            }
        }
    }

    func uploadImage() {
        _ = StorageUploadDataRequest.Options(accessLevel: .guest)
        let houseImage = UIImage(systemName: "house")
        let houseImageData = houseImage!.jpegData(compressionQuality: 1)!
        
        Amplify.Storage.uploadData(key: "house-icon",
                                   data: houseImageData) { result in
            switch result {
            case .success(let uploadKey):
                print("Successfully uploaded image with key: \(uploadKey)")
            case .failure(let storageError):
                print("Error uploading image: \(storageError)")
            }
        }
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel(user: AuthUserEntity(id: "", username: ""), sessionManager: SessionManager()))
}

import SwiftUI
import Amplify

struct HomeView: View {
    @State var image: UIImage?
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            Spacer()
            OpalText(text: "Find the best models for you", style: .headingOne)
                .frame(maxWidth: .infinity)
            
            if let image = self.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .frame(width: 100, height: 100)
            }
            
            Button("Download", action: {
                downloadImage(imageName: "brain.png")
            })
            Button("Upload", action: {
                uploadImage()
            })
            Spacer()
            OpalButton(title: "Sign Out", style: .secondary, action: viewModel.signOut)
                .padding(.horizontal)
        }
    }
    
    func listFiles() {
        let options = StorageListRequest.Options(accessLevel: .guest)
        Amplify.Storage.list(options: options) { result in
            print(result)
            switch result {
            case .success(let listResult):
                for item in listResult.items {
                    print("Arquivo encontrado: \(item.key)")
                }
            case .failure(let error):
                print("Erro ao listar arquivos: \(error)")
            }
        }
    }
    
    func downloadImage(imageName: String) {
        Amplify.Storage.downloadData(key: imageName) { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.image = UIImage(data: data)
                }
                
            case .failure(let error):
                print("Error downloading image \(imageName):", error)
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

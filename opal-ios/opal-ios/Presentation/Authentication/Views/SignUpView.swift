import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel: SignUpViewModel
    
    
    var body: some View {
        VStack {
            Spacer()
            
            TextField("Username", text: $viewModel.username).pretty()
            TextField("Email", text: $viewModel.email).pretty()
            SecureField("Password", text: $viewModel.password).pretty()
            Button("SignUp", action: {
                viewModel.signUp()
            })
            
            Spacer()
            Button("Already have an account? Log in.", action: viewModel.showLogin)
        }.padding()
    }
}

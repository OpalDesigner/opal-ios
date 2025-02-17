import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel

    var body: some View {
        VStack {
            Spacer()
            OpalText(text: "Opal iOS", style: .headingOne)
                .frame(maxWidth: .infinity, alignment: .leading)
            OpalTextField(placeholder: "Username", text: $viewModel.username, style: .primary, isSecure: false)
            OpalTextField(placeholder: "Password", text: $viewModel.password, style: .primary, isSecure: true)
                .padding(.vertical)
            OpalButton(title: "Log In", style: .primary, action: viewModel.login)
            
            Spacer()
            OpalButton(title: "Sign Up", style: .secondary, action: viewModel.showSignUp)
        }.padding()
    }
}

//#Preview {
//    LoginView(viewModel: LoginViewModel(sessionManager: SessionManager()))
//}


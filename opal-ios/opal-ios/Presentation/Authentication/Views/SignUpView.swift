import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel: SignUpViewModel
    
    
    var body: some View {
        VStack {
            Spacer()
            OpalText(text: "Opal iOS", style: .headingOne)
                .frame(maxWidth: .infinity, alignment: .leading)
            OpalTextField(placeholder: "Username", text: $viewModel.username, style: .primary, isSecure: false)
            OpalTextField(placeholder: "Email", text: $viewModel.email, style: .primary, isSecure: false)
            OpalTextField(placeholder: "Password", text: $viewModel.password, style: .primary, isSecure: true)
            
            OpalButton(title: "SignUp", style: .primary, action: viewModel.signUp)
            Spacer()
            OpalButton(title: "Log In", style: .secondary, action: viewModel.showLogin)

        }.padding()
    }
}

//#Preview {
//    SignUpView(viewModel: SignUpViewModel(sessionManager: SessionManager()))
//}

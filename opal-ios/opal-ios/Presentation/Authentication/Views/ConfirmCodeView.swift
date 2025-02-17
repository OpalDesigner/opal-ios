import SwiftUI

struct ConfirmCodeView: View {
    @ObservedObject var viewModel: ConfirmCodeViewModel
    
    var body: some View {
        VStack {
            Spacer()
            OpalText(text: "Enter the confirmation code sent to your email", style: .headingOne)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            
            OpalTextField(placeholder: "Confirmation Code", text: $viewModel.code, style: .primary, isSecure: false)
                .padding()
            OpalButton(title: "Confirm", style: .primary, action: viewModel.confirm)
                .padding(.horizontal)
            Spacer()
            OpalButton(title: "Back to Log In", style: .secondary, action: viewModel.showLogin)
                .padding(.horizontal)
        }
    }
}

//#Preview {
//    ConfirmCodeView(viewModel: ConfirmCodeViewModel(username: "", sessionManager: SessionManager()))
//}

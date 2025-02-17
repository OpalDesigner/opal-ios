import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var sessionManager: SessionManager
    
    @State var username = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            Spacer()
            
            TextField("Username", text: $username).pretty()
            TextField("Email", text: $email).pretty()
            SecureField("Password", text: $password).pretty()
            Button("SignUp", action: {
                sessionManager.signUp(username: username, email: email, password: password)
            })
            
            Spacer()
            Button("Already have an account? Log in.", action: sessionManager.showLogin)
        }.padding()
    }
}

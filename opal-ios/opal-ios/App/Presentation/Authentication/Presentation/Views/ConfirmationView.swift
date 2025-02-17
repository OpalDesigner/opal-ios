import SwiftUI

struct ConfirmationView: View {
    
    @EnvironmentObject var sessionManager: SessionManager
    
    @State var confirmationCode = ""
    
    let username: String
    
    var body: some View {
        VStack {
            Spacer()
            Text("Username: \(username)")
            TextField("ConfirmationCode", text: $confirmationCode)
            Button("Confirm", action: {
                sessionManager.confirm(username: username, code: confirmationCode)
            })
        }.padding()
    }
}


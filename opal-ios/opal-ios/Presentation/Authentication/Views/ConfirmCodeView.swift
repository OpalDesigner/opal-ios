import SwiftUI

import SwiftUI

struct ConfirmCodeView: View {
    @ObservedObject var viewModel: ConfirmCodeViewModel
    
    var body: some View {
        VStack {
            Text("Digite o código de confirmação enviado para seu e-mail")
                .padding()
            TextField("Código de Confirmação", text: $viewModel.code)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            Button("Confirmar") {
                viewModel.confirm()
            }
            .padding()
            Button("Voltar para Login") {
                viewModel.showLogin()
            }
            .padding()
        }
        .navigationTitle("Confirmação")
    }
}


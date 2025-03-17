import SwiftUI

struct OpalTextField: View {
    let placeholder: String
    @Binding var text: String
    let style: OpalTextFieldStyle
    let isSecure: Bool
    var context: OpalDesignContext { OpalDesignContextSingleton.shared.context }
    let trailingIcon: Image?
    
    let cornerRadius = 8.0
    let lineWidth = 2.0
    
    var body: some View {
        HStack {
            Group {
                if isSecure {
                    SecureField(placeholder, text: $text)
                } else {
                    TextField(placeholder, text: $text)
                }
            }
            .font(.custom(context.fonts.proximaNova.regular, size: 16))
            .foregroundColor(style.fontColor(for: context))
            
            if let icon = trailingIcon {
                icon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(style.fontColor(for: context))
            }
        }
        .padding()
        .background(style.bgColor(for: context))
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(style.borderColor(for: context), lineWidth: lineWidth)
        )
        .cornerRadius(cornerRadius)
        .frame(maxWidth: .infinity)
    }
}

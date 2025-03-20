import SwiftUI

struct OpalTextField: View {
    let placeholder: String
    @Binding var text: String
    let style: OpalTextFieldStyle
    let isSecure: Bool
    var context: OpalDesignContext { OpalDesignContextSingleton.shared.context }
    let trailingIcon: String?
    let trailingIconColor: Color?
    
    let cornerRadius = 8.0
    let lineWidth = 2.0
    let boxPadding = 12.0
    let fontSize = 16.0
    
    init(
            placeholder: String,
            text: Binding<String>,
            style: OpalTextFieldStyle,
            isSecure: Bool,
            trailingIcon: String? = nil,
            trailingIconColor: Color? = nil
        ) {
            self.placeholder = placeholder
            self._text = text
            self.style = style
            self.isSecure = isSecure
            self.trailingIcon = trailingIcon
            self.trailingIconColor = trailingIconColor
        }
    
    var body: some View {
        HStack {
            Group {
                if isSecure {
                    SecureField(placeholder, text: $text)
                } else {
                    TextField(placeholder, text: $text)
                }
            }
            .font(.custom(context.fonts.proximaNova.regular, size: fontSize))
            .foregroundColor(style.fontColor(for: context))
            
            if let icon = trailingIcon {
                OpalIcon(iconName: icon, color: trailingIconColor, size: OpalIconSize.small)
            }
        }
        .padding(.all, boxPadding)
        .background(style.bgColor(for: context))
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(style.borderColor(for: context), lineWidth: lineWidth)
        )
        .cornerRadius(cornerRadius)
        .frame(maxWidth: .infinity)
    }
}

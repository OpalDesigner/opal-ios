//
//  OpalPicker.swift
//  opal-ios
//
//  Created by Cynara Costa on 22/03/25.
//

import SwiftUI

struct OpalPicker: View {
    let placeholder: String
    @Binding var selection: String
    let options: [OpalFilterEntity]
    let style: OpalPickerStyle
    var context: OpalDesignContext { OpalDesignContextSingleton.shared.context }
    
    let cornerRadius = 8.0
    let lineWidth = 2.0
    let boxPadding = 12.0
    let fontSize = 16.0
    
    var body: some View {
        Menu {
            ForEach(options) { filter in
                Button(action: {
                    selection = filter.category
                }) {
                    Text(filter.text)
                }
            }
        } label: {
            HStack {
                Text(
                    options.first(where: { $0.category == selection })?.text ?? placeholder
                )
                .font(.custom(context.fonts.proximaNova.regular, size: fontSize))
                .foregroundColor(style.fontColor(for: context))
                
                Spacer()
                
                OpalIcon(
                    iconName: context.icons.arrowDown,
                    color: style.fontColor(for: context),
                    size: OpalIconSize.extraSmall
                )
            }
            .padding(boxPadding)
            .background(style.bgColor(for: context))
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(style.borderColor(for: context), lineWidth: lineWidth)
            )
            .cornerRadius(cornerRadius)
        }
    }
}

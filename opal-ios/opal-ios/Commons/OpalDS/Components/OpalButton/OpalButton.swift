//
//  OpalButton.swift
//  opal-ios
//
//  Created by Cynara Costa on 17/02/25.
//

import SwiftUI

struct OpalButton: View {
    let title: String
    let style: OpalButtonStyle
    let action: () -> Void
    var context: OpalDesignContext { OpalDesignContextSingleton.shared.context }
    let cornerRadius = 8.0
    let lineWidth = 2.0
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.custom(context.fonts.proximaNova.bold, size: 16))
                .foregroundColor(style.fontColor(for: context))
                .padding()
                .frame(maxWidth: .infinity)
                .background(style.bgColor(for: context))
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(style.borderColor(for: context), lineWidth: lineWidth)
                )
                .cornerRadius(cornerRadius)
        }
    }
}

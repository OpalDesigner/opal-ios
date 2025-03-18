//
//  OpalFilter.swift
//  opal-ios
//
//  Created by Cynara Costa on 17/03/25.
//

import SwiftUI

struct OpalFilter: View {
    let text: String
    let style: OpalFilterStyle
    let icon: OpalIcon?
    var context: OpalDesignContext { OpalDesignContextSingleton.shared.context }
    let onTap: () -> Void
    
    init(text: String,
         style: OpalFilterStyle,
         icon: OpalIcon? = nil,
         onTap: @escaping () -> Void) {
        self.text = text
        self.style = style
        self.icon = icon
        self.onTap = onTap
    }
    
    let spacingBetween = 8.0
    let verticalPadding = 8.0
    let horizontalPadding = 16.0
    let cornerRadius = 8.0
    let lineWidth = 2.0
    
    var body: some View {
        Button(action: onTap) {
            HStack(spacing: spacingBetween) {
                OpalText(
                    text: text,
                    style: OpalTextStyle.custom(
                        size: 14,
                        weight: Font.Weight.bold,
                        color: style == .selected
                        ? style.selectedFontColor(for: context)
                        : style.unselectedFontColor(for: context),
                        font: context.fonts.inter.regular
                    )
                )
                
                if let icon = icon {
                    icon
                }
            }
            .padding(.vertical, verticalPadding)
            .padding(.horizontal, horizontalPadding)
            .background(
                style == .selected
                ? style.selectedBgColor(for: context)
                : style.unselectedBgColor(for: context)
            )
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(style.borderColor(for: context), lineWidth: lineWidth)
            )
            .cornerRadius(cornerRadius)
        }
    }
}

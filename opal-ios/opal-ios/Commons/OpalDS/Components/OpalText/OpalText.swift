//
//  OpalText.swift
//  opal-ios
//
//  Created by Cynara Costa on 15/02/25.
//

import SwiftUICore

struct OpalText: View {
    let text: String
    let style: OpalTextStyle
    var alignment: TextAlignment = .leading
    var currentTheme: Theme { ThemeManager.shared.currentTheme }
    
    var body: some View {
        Text(text)
            .font(style.font(for: currentTheme))
            .multilineTextAlignment(alignment)
            .foregroundStyle(style.color(for: currentTheme))
    }
}


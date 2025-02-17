//
//  OpalText.swift
//  opal-ios
//
//  Created by Cynara Costa on 15/02/25.
//

import SwiftUI

struct OpalText: View {
    let text: String
    let style: OpalTextStyle
    var alignment: TextAlignment = .leading
    var context: OpalDesignContext { OpalDesignContextSingleton.shared.context }
    
    var body: some View {
        Text(text)
            .font(style.font(for: context))
            .multilineTextAlignment(alignment)
            .foregroundStyle(style.color(for: context))
    }
}


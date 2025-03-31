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
    let action: (() -> Void)?
    
    init(title: String, style: OpalButtonStyle, action: (() -> Void)? = nil) {
        self.title = title
        self.style = style
        self.action = action
    }

    var body: some View {
        if let action = action {
            Button(action: action) {
                OpalButtonContent(title: title, style: style)
            }
        } else {
            OpalButtonContent(title: title, style: style)
        }
    }
}

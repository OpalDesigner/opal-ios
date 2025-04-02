//
//  OpalIconStyle.swift
//  opal-ios
//
//  Created by Cynara Costa on 17/03/25.
//

import SwiftUI

struct OpalIconStyle {
    static let instance = OpalIconStyle()
    
    func color(for context: OpalDesignContext) -> Color {
        return context.colors.font.one
    }
}

//
//  OpalButtonStyle.swift
//  opal-ios
//
//  Created by Cynara Costa on 17/02/25.
//

import SwiftUI

enum OpalButtonStyle {
    case primary
    case secondary
    case disable
    
    func fontColor(for context: OpalDesignContext) -> Color {
        switch self {
        case .primary:
            return context.colors.font.oneInverse
        case .secondary:
            return context.colors.font.one
        case .disable:
            return context.colors.font.oneInverse
        }
    }
    
    func bgColor(for context: OpalDesignContext) -> Color {
        switch self {
        case .primary:
            return context.colors.brand.main
        case .secondary:
            return Color.clear
        case .disable:
            return context.colors.font.two
        }
    }
    
    func borderColor(for context: OpalDesignContext) -> Color {
        switch self {
        case .primary:
            return Color.clear
        case .secondary:
            return context.colors.background.inverse
        case .disable:
            return Color.clear
        }
    }
}

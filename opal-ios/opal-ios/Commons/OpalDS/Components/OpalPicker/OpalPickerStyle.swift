//
//  OpalPickerStyle.swift
//  opal-ios
//
//  Created by Cynara Costa on 22/03/25.
//

import SwiftUI

enum OpalPickerStyle {
    case primary
    case secondary
    case tertiary
    
    func fontColor(for context: OpalDesignContext) -> Color {
        switch self {
        case .primary:
            return context.colors.font.one
        case .secondary:
            return context.colors.font.two
        case .tertiary:
            return context.colors.font.two
        }
    }
    
    func bgColor(for context: OpalDesignContext) -> Color {
        switch self {
        case .primary:
            return context.colors.background.main
        case .secondary:
            return Color.clear
        case .tertiary:
            return context.colors.background.secondary
        }
    }
    
    func borderColor(for context: OpalDesignContext) -> Color {
        switch self {
        case .primary:
            return context.colors.background.inverse
        case .secondary:
            return Color.clear
        case .tertiary:
            return Color.clear
        }
    }
}

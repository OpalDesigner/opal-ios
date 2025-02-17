//
//  OpalTextFieldStyle.swift
//  opal-ios
//
//  Created by Cynara Costa on 17/02/25.
//

import SwiftUI

enum OpalTextFieldStyle {
    case primary
    case secondary
    
    func fontColor(for context: OpalDesignContext) -> Color {
        switch self {
        case .primary:
            return context.colors.font.one
        case .secondary:
            return context.colors.font.two
        }
    }
    
    func bgColor(for context: OpalDesignContext) -> Color {
        switch self {
        case .primary:
            return context.colors.background.main
        case .secondary:
            return Color.clear
        }
    }
    
    func borderColor(for context: OpalDesignContext) -> Color {
        switch self {
        case .primary:
            return context.colors.background.inverse
        case .secondary:
            return Color.clear
        }
    }
}

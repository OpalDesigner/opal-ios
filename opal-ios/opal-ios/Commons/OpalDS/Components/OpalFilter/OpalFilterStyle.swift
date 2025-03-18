//
//  OpalFilterStyle.swift
//  opal-ios
//
//  Created by Cynara Costa on 17/03/25.
//

import SwiftUI

enum OpalFilterStyle {
    case selected
    case unselected
    
    func selectedFontColor(for context: OpalDesignContext) -> Color {
        switch self {
        case .selected:
            return context.colors.font.oneInverse
        case .unselected:
            return context.colors.font.one
        }
    }
    
    func unselectedFontColor(for context: OpalDesignContext) -> Color {
        switch self {
        case .selected:
            return context.colors.font.oneInverse
        case .unselected:
            return context.colors.font.one
        }
    }
    
    func selectedBgColor(for context: OpalDesignContext) -> Color {
        switch self {
        case .selected:
            return context.colors.background.inverse
        case .unselected:
            return context.colors.background.main
        }
    }
    
    func unselectedBgColor(for context: OpalDesignContext) -> Color {
        switch self {
        case .selected:
            return context.colors.background.inverse
        case .unselected:
            return context.colors.background.main
        }
    }
    
    func borderColor(for context: OpalDesignContext) -> Color {
        switch self {
        case .selected:
            return Color.clear
        case .unselected:
            return context.colors.background.inverse
        }
    }
}

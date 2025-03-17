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
    
    func fontColor(for context: OpalDesignContext) -> Color {
        switch self {
        case .selected:
            return context.colors.font.oneInverse
        case .unselected:
            return context.colors.font.one
        }
    }
    
    func bgColor(for context: OpalDesignContext) -> Color {
        switch self {
        case .selected:
            return context.colors.background.inverse
        case .unselected:
            return context.colors.background.main
        }
    }
}

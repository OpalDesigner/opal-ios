//
//  OpalTextStyle.swift
//  opal-ios
//
//  Created by Cynara Costa on 15/02/25.
//

import SwiftUI

enum OpalTextStyle {
    case headingOne
    case headingTwo
    case description
    case bodyOne
    case custom(size: CGFloat, weight: Font.Weight, color: Color, font: String)
    
    func font(for theme: Theme) -> Font {
        switch self {
        case .headingOne:
            return .custom(theme.fonts.proximaNova.bold, size: 32)
        case .headingTwo:
            return .custom(theme.fonts.proximaNova.bold, size: 16)
        case .description:
            return .custom(theme.fonts.inter.regular, size: 14)
        case .bodyOne:
            return .custom(theme.fonts.inter.regular, size: 10)
        case .custom(size: let size, _, _, font: let font):
            return .custom(font, size: size)
        }
    }
    
    func color(for theme: Theme) -> Color {
        switch self {
        case .headingOne:
            return theme.colors.font.one
        case .headingTwo:
            return theme.colors.font.one
        case .description:
            return theme.colors.font.two
        case .bodyOne:
            return theme.colors.font.two
        case .custom(_, _, color: let color, _):
            return color
        }
    }
}

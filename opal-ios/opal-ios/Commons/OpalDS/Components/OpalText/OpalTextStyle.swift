//
//  OpalTextStyle.swift
//  opal-ios
//
//  Created by Cynara Costa on 15/02/25.
//

import SwiftUI

enum OpalTextStyle {
    case heading
    case headingOne
    case headingTwo
    case description
    case bodyOne
    case custom(size: CGFloat, weight: Font.Weight, color: Color, font: String)
    
    func font(for context: OpalDesignContext) -> Font {
        switch self {
        case .heading:
            return .custom(context.fonts.proximaNova.bold, size: 48)
        case .headingOne:
            return .custom(context.fonts.proximaNova.bold, size: 32)
        case .headingTwo:
            return .custom(context.fonts.proximaNova.bold, size: 16)
        case .description:
            return .custom(context.fonts.inter.regular, size: 14)
        case .bodyOne:
            return .custom(context.fonts.inter.regular, size: 10)
        case .custom(size: let size, _, _, font: let font):
            return .custom(font, size: size)
        }
    }
    
    func color(for context: OpalDesignContext) -> Color {
        switch self {
        case .heading:
            return context.colors.font.one
        case .headingOne:
            return context.colors.font.one
        case .headingTwo:
            return context.colors.font.one
        case .description:
            return context.colors.font.two
        case .bodyOne:
            return context.colors.font.two
        case .custom(_, _, color: let color, _):
            return color
        }
    }
}

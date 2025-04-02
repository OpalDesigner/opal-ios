//
//  OpalImageStyle.swift
//  opal-ios
//
//  Created by Cynara Costa on 01/04/25.
//

import SwiftUI

enum OpalImageStyle {
    case onBrand
    case onFont
    case onBrandSplash
    
    func color(for context: OpalDesignContext) -> Color {
        switch self {
        case .onBrand:
            return context.colors.brand.main
        case .onBrandSplash:
            return context.colors.brand.splash
        case .onFont:
            return context.colors.font.one
        }
    }
}

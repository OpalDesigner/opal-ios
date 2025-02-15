//
//  DarkTheme.swift
//  opal-ios
//
//  Created by Cynara Costa on 15/02/25.
//

import SwiftUICore

struct DarkTheme: Theme {
    let colors: OpalDesignTokensColors = OpalDarkColors()
}

struct OpalDarkColors: OpalDesignTokensColors {
    let brand: OpalBrandColors = OpalDarkColorsBrand()
    
    let font: OpalFontColors = OpalDarkColorsFont()
    
    let primary: OpalPrimaryColors = OpalDarkColorsPrimary()
    
    let secondary: OpalSecondaryColors = OpalDarkColorsSecondary()
    
    let background: OpalBackgroundColors = OpalDarkColorsBackground()
}

struct OpalDarkColorsBrand: OpalBrandColors {
    let main: Color = .red
}

struct OpalDarkColorsFont: OpalFontColors {
    var one: Color = Color.darkFontOne
    var two: Color = Color.darkFontTwo
}

struct OpalDarkColorsPrimary: OpalPrimaryColors {
    let one: Color = .red
}

struct OpalDarkColorsSecondary: OpalSecondaryColors {
    let one: Color = .red
}

struct OpalDarkColorsBackground: OpalBackgroundColors {
    var secondary: Color = Color.darkSecondaryBackground
    var selected: Color = Color.darkSelectedBackground
    var transparency: Color = Color.darkTransparencyBackground
    let main: Color = Color.darkMainBackground
}

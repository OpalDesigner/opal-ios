//
//  DarkTheme.swift
//  opal-ios
//
//  Created by Cynara Costa on 15/02/25.
//

import SwiftUICore

struct DarkTheme: Theme {
    let fonts: OpalDesignTokensFonts = OpalDarkFonts()
    
    let colors: OpalDesignTokensColors = OpalDarkColors()
}

struct OpalDarkFonts: OpalDesignTokensFonts {
    let proximaNova: OpalProximaNovaFont = OpalDarkProximaNovaFonts()
    let inter: OpalInterFont = OpalDarkInterFonts()
}

struct OpalDarkProximaNovaFonts: OpalProximaNovaFont {
    let regular: String = "ProximaNova-Regular"
    
    var bold: String = "ProximaNova-Bold"
}

struct OpalDarkInterFonts: OpalInterFont {
    let regular: String = "Inter24pt-Regular"
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

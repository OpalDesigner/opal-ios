//
//  LightTheme.swift
//  opal-ios
//
//  Created by Cynara Costa on 15/02/25.
//

import SwiftUICore

struct LightTheme: Theme {
    let fonts: OpalDesignTokensFonts = OpalLightFonts()
    
    let colors: OpalDesignTokensColors = OpalLightColors()
}

struct OpalLightFonts: OpalDesignTokensFonts {
    let proximaNova: OpalProximaNovaFont = OpalLightProximaNovaFonts()
    let inter: OpalInterFont = OpalLightInterFonts()
}

struct OpalLightProximaNovaFonts: OpalProximaNovaFont {
    let regular: String = "ProximaNova-Regular"
    
    var bold: String = "ProximaNova-Bold"
}

struct OpalLightInterFonts: OpalInterFont {
    let regular: String = "Inter24pt-Regular"
}

struct OpalLightColors: OpalDesignTokensColors {
    let brand: OpalBrandColors = OpalDarkColorsBrand()
    
    let font: OpalFontColors = OpalDarkColorsFont()
    
    let primary: OpalPrimaryColors = OpalDarkColorsPrimary()
    
    let secondary: OpalSecondaryColors = OpalDarkColorsSecondary()
    
    let background: OpalBackgroundColors = OpalDarkColorsBackground()
}

struct OpalLightColorsBrand: OpalBrandColors {
    let main: Color = .red
}

struct OpalLightColorsFont: OpalFontColors {
    var one: Color = Color.lightFontOne
    var two: Color = Color.lightFontTwo
}

struct OpalLightColorsPrimary: OpalPrimaryColors {
    let one: Color = .red
}

struct OpalLightColorsSecondary: OpalSecondaryColors {
    let one: Color = .red
}

struct OpalLightColorsBackground: OpalBackgroundColors {
    var secondary: Color = Color.lightSecondaryBackground
    var selected: Color = Color.lightSelectedBackground
    var transparency: Color = Color.lightTransparencyBackground
    let main: Color = Color.lightMainBackground
}

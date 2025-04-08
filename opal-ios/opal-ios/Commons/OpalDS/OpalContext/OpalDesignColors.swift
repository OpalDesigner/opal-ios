//
//  OpalDesignColors.swift
//  opal-ios
//
//  Created by Cynara Costa on 15/02/25.
//

import SwiftUI

struct OpalDesignColors: OpalDesignTokensColors {
    let brand: OpalBrandColors = OpalDesignColorsBrand()
    
    let font: OpalFontColors = OpalDesignColorsFont()
    
    let primary: OpalPrimaryColors = OpalDesignColorsPrimary()
    
    let secondary: OpalSecondaryColors = OpalDesignColorsSecondary()
    
    let background: OpalBackgroundColors = OpalDesignColorsBackground()
}

struct OpalDesignColorsBrand: OpalBrandColors {
    let main: Color = Color.brandBlue
    let splash: Color = Color.brandSplash
}

struct OpalDesignColorsFont: OpalFontColors {
    var one: Color = Color.fontOne
    var two: Color = Color.fontTwo
    var oneInverse: Color = Color.fontOneInverse
}

struct OpalDesignColorsPrimary: OpalPrimaryColors {
    let one: Color = .red
}

struct OpalDesignColorsSecondary: OpalSecondaryColors {
    let one: Color = .red
}

struct OpalDesignColorsBackground: OpalBackgroundColors {
    var secondary: Color = Color.secondaryBackground
    var selected: Color = Color.selectedBackground
    var transparency: Color = Color.transparencyBackground
    var main: Color = Color.mainBackground
    var inverse: Color = Color.inverseBackground
    var splash: Color = Color.splashBackground
}

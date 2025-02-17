//
//  OpalColors.swift
//  opal-ios
//
//  Created by Cynara Costa on 15/02/25.
//

import SwiftUI

protocol OpalDesignTokensColors {
    var brand: OpalBrandColors { get }
    var font: OpalFontColors { get }
    var primary: OpalPrimaryColors { get }
    var secondary: OpalSecondaryColors { get }
    var background: OpalBackgroundColors { get }
}

protocol OpalBrandColors {
    var main: Color { get }
}

protocol OpalFontColors {
    var one: Color { get }
    var two: Color { get }
    var oneInverse: Color { get }
}

protocol OpalPrimaryColors {
    var one: Color { get }
}

protocol OpalSecondaryColors {
    var one: Color { get }
}

protocol OpalBackgroundColors {
    var main: Color { get }
    var secondary: Color { get }
    var selected: Color { get }
    var transparency: Color { get }
    var inverse: Color { get }
}

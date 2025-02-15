//
//  Theme.swift
//  opal-ios
//
//  Created by Cynara Costa on 15/02/25.
//

protocol OpalDesignContext {
    var colors: OpalDesignTokensColors { get }
    var fonts: OpalDesignTokensFonts { get }
}

struct OpalDesignContextBase: OpalDesignContext {
    let fonts: OpalDesignTokensFonts = OpalDesignFonts()
    let colors: OpalDesignTokensColors = OpalDesignColors()
}



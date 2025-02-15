//
//  OpalDesignFonts.swift
//  opal-ios
//
//  Created by Cynara Costa on 15/02/25.
//

struct OpalDesignFonts: OpalDesignTokensFonts {
    let proximaNova: OpalProximaNovaFont = OpalDesignProximaNovaFonts()
    let inter: OpalInterFont = OpalDesignInterFonts()
}

struct OpalDesignProximaNovaFonts: OpalProximaNovaFont {
    let regular: String = "ProximaNova-Regular"
    
    var bold: String = "ProximaNova-Bold"
}

struct OpalDesignInterFonts: OpalInterFont {
    let regular: String = "Inter24pt-Regular"
}

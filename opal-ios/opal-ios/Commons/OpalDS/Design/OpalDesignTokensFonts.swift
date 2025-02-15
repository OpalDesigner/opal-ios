//
//  OpalDesignTokensFonts.swift
//  opal-ios
//
//  Created by Cynara Costa on 15/02/25.
//

import SwiftUI

protocol OpalDesignTokensFonts {
    var proximaNova: OpalProximaNovaFont { get }
    var inter: OpalInterFont { get }
}

protocol OpalProximaNovaFont {
    var regular: String { get }
    var bold: String { get }
}

protocol OpalInterFont {
    var regular: String { get }
}

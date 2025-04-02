//
//  OpalImageStyle.swift
//  opal-ios
//
//  Created by Cynara Costa on 01/04/25.
//

import SwiftUI

struct OpalImageStyle {
    static let instance = OpalImageStyle()
    
    func color(for context: OpalDesignContext) -> Color {
        return context.colors.font.one
    }
}

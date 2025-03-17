//
//  OpalIconSize.swift
//  opal-ios
//
//  Created by Cynara Costa on 17/03/25.
//

import SwiftUI

enum OpalIconSize: CGFloat {
    case small = 16
    case medium = 20
    case large = 24
    
    var size: CGFloat {
        return self.rawValue
    }
}

//
//  OpalImageSize.swift
//  opal-ios
//
//  Created by Cynara Costa on 01/04/25.
//

import SwiftUI

enum OpalImageSize {
    case medium

    var sizeRatios: (width: CGFloat, height: CGFloat) {
        switch self {
        case .medium: return (0.48, 0.235)
        }
    }

    var width: CGFloat {
        UIScreen.main.bounds.width * sizeRatios.width
    }

    var height: CGFloat {
        UIScreen.main.bounds.height * sizeRatios.height
    }

    var size: CGSize {
        CGSize(width: width, height: height)
    }
}

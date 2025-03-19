//
//  FilterEntity.swift
//  opal-ios
//
//  Created by Cynara Costa on 18/03/25.
//

import SwiftUI

struct OpalFilterEntity: Identifiable {
    let id = UUID()
    let text: String
    var style: OpalFilterStyle
    var icon: OpalIcon?
}

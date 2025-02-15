//
//  ThemeManager.swift
//  opal-ios
//
//  Created by Cynara Costa on 15/02/25.
//

import SwiftUI

final class OpalDesignContextSingleton: ObservableObject {
    static let shared = OpalDesignContextSingleton()
    
    @Published var context: OpalDesignContext = OpalDesignContextBase()
}

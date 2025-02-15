//
//  ThemeManager.swift
//  opal-ios
//
//  Created by Cynara Costa on 15/02/25.
//

import SwiftUI

final class ThemeManager: ObservableObject {
    static let shared = ThemeManager()
    
    @Published var currentTheme: Theme = LightTheme()
    private var isManualOverride: Bool = false

    private init() { }
    
    func toggleTheme() {
        isManualOverride = true
        currentTheme = currentTheme is LightTheme ? DarkTheme() : LightTheme()
    }
    
    func updateTheme(for systemColorScheme: ColorScheme) {
        if !isManualOverride {
            currentTheme = systemColorScheme == .dark ? DarkTheme() : LightTheme()
        }
    }
    
    func resetToSystemTheme() {
        isManualOverride = false
    }
}

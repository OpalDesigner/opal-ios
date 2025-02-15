//
//  opal_iosApp.swift
//  opal-ios
//
//  Created by Cynara Costa on 15/02/25.
//

import SwiftUI

@main
struct opal_iosApp: App {
    @StateObject private var opalContext = OpalDesignContextSingleton.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(opalContext)
        }
    }
}

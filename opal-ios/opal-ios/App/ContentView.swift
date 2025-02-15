//
//  ContentView.swift
//  opal-ios
//
//  Created by Cynara Costa on 15/02/25.
//

import SwiftUI

struct ContentView: View {
    var currentTheme: Theme { ThemeManager.shared.currentTheme }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            OpalText(text: "Find the best models for you", style: .headingOne)
        }
        .padding()
        .onAppear {
            print("CYNARA \(currentTheme.colors.font.one)")
        }
    }
}

#Preview {
    ContentView()
}

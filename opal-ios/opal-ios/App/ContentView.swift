//
//  ContentView.swift
//  opal-ios
//
//  Created by Cynara Costa on 15/02/25.
//

import SwiftUI

struct ContentView: View {
    var context: OpalDesignContext { OpalDesignContextSingleton.shared.context }
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            OpalText(text: "Find the best models for you", style: .headingOne)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

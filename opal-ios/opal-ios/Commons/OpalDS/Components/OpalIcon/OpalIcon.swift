//
//  OpalIcon.swift
//  opal-ios
//
//  Created by Cynara Costa on 17/03/25.
//

import SwiftUI

struct OpalIcon: View {
    let iconName: String
    let color: Color?
    let size: OpalIconSize
    let style: OpalIconStyle = .instance
    var context: OpalDesignContext { OpalDesignContextSingleton.shared.context }
    
    init(
        iconName: String,
        color: Color? = nil,
        size: OpalIconSize = OpalIconSize.medium
    ) {
        self.iconName = iconName
        self.color = color
        self.size = size
    }
        
    var body: some View {
        if UIImage(named: iconName) != nil {
            Image(iconName)
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: size.rawValue, height: size.rawValue)
                .foregroundStyle(color ?? style.color(for: context))
        } else {
            EmptyView()
        }
    }
}
    

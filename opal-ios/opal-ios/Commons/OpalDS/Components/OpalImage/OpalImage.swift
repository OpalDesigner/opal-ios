//
//  OpalImage.swift
//  opal-ios
//
//  Created by Cynara Costa on 01/04/25.
//

import SwiftUI

struct OpalImage: View {
    var imageName: String
    var color: Color?
    var size: OpalImageSize
    var style: OpalImageStyle
    var context: OpalDesignContext { OpalDesignContextSingleton.shared.context }
    
    init(
        imageName: String,
        color: Color? = nil,
        style: OpalImageStyle,
        size: OpalImageSize = OpalImageSize.medium
    ) {
        self.imageName = imageName
        self.color = color
        self.size = size
        self.style = style
    }
        
    var body: some View {
        if UIImage(named: imageName) != nil {
            Image(imageName)
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: size.width, height: size.height)
                .foregroundStyle(color ?? style.color(for: context))
        } else {
            EmptyView()
        }
    }
}

//
//  LoadingModelVIew.swift
//  opal-ios
//
//  Created by Cynara Costa on 19/02/25.
//

import SwiftUI

struct LoadingModelView: View {
    var body: some View {
        ProgressView()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
    }
}

#Preview {
    LoadingModelView()
}

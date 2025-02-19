//
//  Scene.swift
//  opal-ios
//
//  Created by Cynara Costa on 19/02/25.
//

import SwiftUI
import SceneKit

struct SceneKitModelView: UIViewRepresentable {
    let modelFileURL: URL

    func makeUIView(context: Context) -> SCNView {
        let scnView = SCNView()
        scnView.allowsCameraControl = true
        scnView.autoenablesDefaultLighting = true
        scnView.backgroundColor = .black

        do {
            let scene = try SCNScene(url: modelFileURL, options: nil)
            scnView.scene = scene
        } catch {
            print("Error loading model: \(error)")
        }
        
        return scnView
    }

    func updateUIView(_ uiView: SCNView, context: Context) {}
}

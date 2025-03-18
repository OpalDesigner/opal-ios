//
//  ARView.swift
//  opal-ios
//
//  Created by Cynara Costa on 18/02/25.
//

import SwiftUI
import RealityKit
import ARKit

struct ARModelView: UIViewRepresentable {
    let modelFileURL: URL
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        arView.session.run(config)
        
//        Task {
//            do {
//                let loadRequest = ModelEntity.loadAsync(contentsOf: modelFileURL)
//                
//                print("CYNARA load request \(loadRequest)")
//                let modelEntity = try loadRequest.result!.get()
//                print("CYNARA ENTITY \(modelEntity)")
//                let anchor = AnchorEntity(plane: .any)
//                anchor.addChild(modelEntity)
//                arView.scene.addAnchor(anchor)
//            } catch {
//                print("Erro ao carregar ModelEntity: \(error)")
//            }
//        }
        
//        Task {
//            do {
//                let entity = try? Entity.load(contentsOf: modelFileURL)
//                let anchor = AnchorEntity(plane: .any)
//                anchor.addChild(entity!)
//                arView.scene.addAnchor(anchor)
//            } catch {
//                print("Erro ao carregar ModelEntity: \(error)")
//            }
//        }
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
}

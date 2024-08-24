import Foundation
import SwiftUI
import SceneKit

struct StaticPyramidView: View {
    var body: some View {
        ZStack {
            // Warm gradient background
            LinearGradient(
                gradient: Gradient(colors: [.pink.opacity(0.3), .orange.opacity(0.3), .red.opacity(0.3)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)

            // SceneKit view with static pyramid
//            StaticRotatingPyramidView()
//                .frame(width: 350, height: 300)
//         
        }
    }
}

struct StaticRotatingPyramidView: UIViewRepresentable {
    func makeUIView(context: Context) -> SCNView {
        let scnView = SCNView()
        scnView.scene = createScene()
        scnView.allowsCameraControl = false
        scnView.autoenablesDefaultLighting = true
        scnView.backgroundColor = UIColor.clear // Make the background clear
        return scnView
    }
    
    func updateUIView(_ scnView: SCNView, context: Context) {
        // No need to update anything in this example
    }
    
    func createScene() -> SCNScene {
        let scene = SCNScene()
        
        // Create the pyramid with a shorter height
        let pyramidGeometry = SCNPyramid(width: 1.25, height: 1, length: 1.25)
        
        // Apply gradient-like colors using multiple materials
        let material1 = SCNMaterial()
        material1.diffuse.contents = UIColor.systemPink.withAlphaComponent(0.5)
        
        let material2 = SCNMaterial()
        material2.diffuse.contents = UIColor.systemOrange.withAlphaComponent(0.5)
        
        let material3 = SCNMaterial()
        material3.diffuse.contents = UIColor.systemRed.withAlphaComponent(0.5)
        
        pyramidGeometry.materials = [material1, material2, material3, material1, material2] // Assign materials to faces
        
        let pyramidNode = SCNNode(geometry: pyramidGeometry)
        pyramidNode.position = SCNVector3(0, 0, 0)
        
        // Add the pyramid to the scene (no animation)
        scene.rootNode.addChildNode(pyramidNode)
        
        return scene
    }
}

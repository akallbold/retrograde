import SwiftUI
import SceneKit

struct SpinningPyramidView: View {
    var body: some View {
        ZStack {
            // Warm gradient background
            LinearGradient(
                gradient: Gradient(colors: [.pink.opacity(0.3), .orange.opacity(0.3), .red.opacity(0.3)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)

            // SceneKit view with rotating pyramid
            RotatingPyramidView()
                .frame(width: 350, height: 300)
            
            // Overlay to ensure text visibility (optional)
            Color.black.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
                .blendMode(.overlay)
        }
    }
}

struct RotatingPyramidView: UIViewRepresentable {
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
        
        // Apply a softer gradient texture to the pyramid
        let gradient = UIImage.gradientImage(
            with: [UIColor.systemPink.withAlphaComponent(0.5),
                   UIColor.systemOrange.withAlphaComponent(0.5),
                   UIColor.systemRed.withAlphaComponent(0.5)],
            size: CGSize(width: 100, height: 100)
        )
        pyramidGeometry.firstMaterial?.diffuse.contents = gradient
        
        let pyramidNode = SCNNode(geometry: pyramidGeometry)
        pyramidNode.position = SCNVector3(0, 0, 0)
        
        // Add the pyramid to the scene
        scene.rootNode.addChildNode(pyramidNode)
        
        // Add slower rotation animation
        let rotation = CABasicAnimation(keyPath: "rotation")
        rotation.toValue = NSValue(scnVector4: SCNVector4(0, 1, 0, CGFloat.pi * 2))
        rotation.duration = 30
        rotation.repeatCount = .infinity
        pyramidNode.addAnimation(rotation, forKey: "rotation")
        
        return scene
    }
}

extension UIImage {
    static func gradientImage(with colors: [UIColor], size: CGSize) -> UIImage? {
        let layer = CAGradientLayer()
        layer.frame = CGRect(origin: .zero, size: size)
        layer.colors = colors.map { $0.cgColor }
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 1)
        
        UIGraphicsBeginImageContext(layer.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else { return nil }
        layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

#Preview {
    SpinningPyramidView()
}

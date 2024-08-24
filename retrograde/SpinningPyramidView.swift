import SwiftUI

struct SpinningPyramidView: View {
    var body: some View {
        ZStack {
            // Warm background color gradient
            LinearGradient(
                gradient: Gradient(colors: [.pink.opacity(0.3), .orange.opacity(0.3), .red.opacity(0.3)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            // Light rays effect with warm colors
            LinearGradient(
                gradient: Gradient(colors: [.clear, .white.opacity(0.2)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .blendMode(.screen)
            
            // 3D pyramid structure
            ZStack {
                PyramidFace()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [Color.red, Color.orange]),
                        startPoint: .top,
                        endPoint: .bottomTrailing
                    ))
                
                PyramidFace()
                    .fill(LinearGradient(
                        gradient: Gradient(colors: [Color.orange, Color.pink]),
                        startPoint: .top,
                        endPoint: .bottomTrailing
                    ))
                    .rotationEffect(.degrees(120)) // Offset the second face for a 3D effect
            }
            .frame(width: 200, height: 200)
            
            // Overlay to ensure text visibility
            Color.black.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
                .blendMode(.overlay)
        }
    }
}

struct PyramidFace: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let top = CGPoint(x: rect.midX, y: rect.minY)
        let bottomLeft = CGPoint(x: rect.minX, y: rect.maxY)
        let bottomRight = CGPoint(x: rect.maxX, y: rect.maxY)
        
        path.move(to: top)
        path.addLine(to: bottomLeft)
        path.addLine(to: bottomRight)
        path.closeSubpath()
        
        return path
    }
}

#Preview {
    SpinningPyramidView()
}

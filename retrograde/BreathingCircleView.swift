import SwiftUI

struct BreathingCircleView: View {
    @State private var scale: CGFloat = 0.5
    @State private var animate = false
    
    var body: some View {
        ZStack {
            // Peaceful background color gradient
            LinearGradient(
                gradient: Gradient(colors: [.blue.opacity(0.3), .purple.opacity(0.3)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            // Light rays effect
            LinearGradient(
                gradient: Gradient(colors: [.clear, .white.opacity(0.2)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .rotationEffect(.degrees(animate ? 360 : 0))
            .animation(
                Animation.linear(duration: 20).repeatForever(autoreverses: false)
            )
            .onAppear {
                animate = true
            }
            .blendMode(.screen)
            
            // Expanding and contracting circle
            Circle()
                .fill(LinearGradient(
                    gradient: Gradient(colors: [Color.white.opacity(0.8), Color.blue.opacity(0.8)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
                .frame(width: 350, height: 350)  // Increased size of the circle
                .scaleEffect(scale)
                .animation(Animation.easeInOut(duration: 8).repeatForever(autoreverses: true))  // Slower animation
                .onAppear {scale = 1.0}
            
            // Overlay to ensure text visibility
            Color.black.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
                .blendMode(.overlay)
        }
    }
}

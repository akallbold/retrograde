import SwiftUI

struct BreathingCircleView: View {
    @State private var scale: CGFloat = 0.5
    @State private var animate = false
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.blue.opacity(0.3), .purple.opacity(0.3)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            
            LinearGradient(
                gradient: Gradient(colors: [.clear, .white.opacity(0.2)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .rotationEffect(.degrees(animate ? 360 : 0))
            .animation(
                .linear(duration: 20).repeatForever(autoreverses: false),
                value: animate
            )
            .onAppear {
                animate = true
            }
            .blendMode(.screen)
            
            Circle()
                .fill(LinearGradient(
                    gradient: Gradient(colors: [Color.white.opacity(0.8), Color.blue.opacity(0.8)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
                .frame(width: 350, height: 350)  // Increased size of the circle
                .scaleEffect(scale)
                .animation(
                    .easeInOut(duration: 8).repeatForever(autoreverses: true),
                    value: scale
                )
                .onAppear { scale = 1.0 }
            
            Color.black.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
                .blendMode(.overlay)
        }
    }
}

#Preview {
    BreathingCircleView()
}

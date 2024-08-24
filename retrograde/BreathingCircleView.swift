import SwiftUI

struct BreathingCircleView: View {
    @State private var scale: CGFloat = 0.5
    
    var body: some View {
        ZStack {
            // Peaceful background color gradient
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            // Expanding and contracting circle
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.8), Color.blue.opacity(0.8)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 200, height: 200)
                .scaleEffect(scale)
                .animation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: true))
                .onAppear {
                    scale = 1.0
                }
        }
    }
}

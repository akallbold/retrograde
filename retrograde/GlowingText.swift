import SwiftUI

struct GlowingText: View {
    let text: String
    
    @State private var opacity: Double = 1.0
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .foregroundColor(.green)
            .opacity(opacity)
            .shadow(color: .green, radius: 10, x: 0, y: 0)
            .shadow(color: .green, radius: 10, x: 0, y: 0)
            .overlay(
                Text(text)
                    .font(.largeTitle)
                    .foregroundColor(.white.opacity(0.5))
                    .blur(radius: 2)
                    .offset(x: -2, y: -2)
                    .opacity(opacity)
            )
            .onAppear {
                flickerText()
            }
    }
    
    func flickerText() {
        withAnimation(Animation.easeInOut(duration: Double.random(in: 0.05...0.2)).repeatForever(autoreverses: true)) {
            opacity = Double.random(in: 0.5...1.0)
        }
        
        // Schedule the next flicker with a random delay
        DispatchQueue.main.asyncAfter(deadline: .now() + Double.random(in: 0.1...0.5)) {
            flickerText()
        }
    }
}

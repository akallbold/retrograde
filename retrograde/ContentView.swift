import SwiftUI

struct ContentView: View {
    @State private var isRetrograde: Bool? = nil
    @State private var transitionDate: Date? = nil
    @State private var isLoading: Bool = true
    
    var body: some View {
        ZStack {
            if isLoading {
                Color.gray.edgesIgnoringSafeArea(.all)
                Text("Checking mercury status...")
                    .foregroundColor(.white)
                    .font(.largeTitle)
            } else if let isRetrograde = isRetrograde, let transitionDate = transitionDate {
                if isRetrograde {
                    StarFieldView().edgesIgnoringSafeArea(.all)
                    GlowingText(text: "Mercury is in Retrograde until \(formattedDate(transitionDate))")
                } else {
                    ZStack {
                        BreathingCircleView()
                        LightRaysView()
                    }
                    .edgesIgnoringSafeArea(.all)
                    Text("Mercury is not in Retrograde until \(formattedDate(transitionDate))")
                        .font(.custom("Optima", size: 24))
                        .foregroundColor(.white)
                        .padding()
                }
            } else {
                // Fallback UI if no data is available
                Color.gray.edgesIgnoringSafeArea(.all)
                Text("No retrograde data available")
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
        }
        .onAppear {
            checkStatus()
        }
    }
    
    func checkStatus() {
        let status = checkRetrogradeStatus()
        self.isRetrograde = status.isRetrograde
        self.transitionDate = status.transitionDate
        self.isLoading = false
    }
    
    func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
}

struct GradientBackgroundView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [.blue, .purple]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}

struct LightRaysView: View {
    @State private var animate = false
    
    var body: some View {
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
    }
}

#Preview {
    ContentView()
}

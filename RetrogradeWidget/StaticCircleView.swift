import SwiftUI

struct StaticCircleView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.blue.opacity(0.3), .purple.opacity(0.3)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all)
            .frame(width: 400, height: 400)
            
            Circle()
                .fill(LinearGradient(
                    gradient: Gradient(colors: [Color.white.opacity(0.8), Color.blue.opacity(0.8)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
                .frame(width: 100, height: 100)
                .scaleEffect(1)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

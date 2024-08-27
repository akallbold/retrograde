import SwiftUI

struct NoDataView: View {
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
            
            
            Circle()
                .fill(LinearGradient(
                    gradient: Gradient(colors: [Color.white.opacity(0.8), Color.blue.opacity(0.8)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
                .frame(width: 350, height: 350)  // Increased size of the circle
              
                .onAppear {scale = 1.0}
            
            Color.black.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
                .blendMode(.overlay)
        }
    }
}
#Preview {
    NoDataView()
}

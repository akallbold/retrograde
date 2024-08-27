import Foundation
import SwiftUI


struct StaticPyramidView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.pink.opacity(0.3), .orange.opacity(0.3), .red.opacity(0.3)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .frame(width: 500, height: 500)
            .edgesIgnoringSafeArea(.all)
            
            Image("triangle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 125, height: 125)

            
        }
        .edgesIgnoringSafeArea(.all)
    }
    
}


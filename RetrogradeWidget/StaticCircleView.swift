//
//  StaticCircleView.swift
//  retrograde
//
//  Created by Anna Kallenborn-Bolden on 8/24/24.
//

import Foundation
import SwiftUI

struct StaticCircleView: View {
    @State private var scale: CGFloat = 1.0  // Set scale to 1.0 since there's no animation

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.blue.opacity(0.3), .purple.opacity(0.3)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
//            .edgesIgnoringSafeArea(.all)
            
            LinearGradient(
                gradient: Gradient(colors: [.clear, .white.opacity(0.2)]),
                startPoint: .top,
                endPoint: .bottom
            )
//            .blendMode(.screen)
            
            Circle()
                .fill(LinearGradient(
                    gradient: Gradient(colors: [Color.white.opacity(0.8), Color.blue.opacity(0.8)]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ))
                .frame(width: 350, height: 350)
                .scaleEffect(scale)
            
        }
    }
}

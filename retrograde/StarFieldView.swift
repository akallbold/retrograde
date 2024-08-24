//
//  StarFieldView.swift
//  retrograde
//
//  Created by Anna Kallenborn-Bolden on 8/21/24.
//

import Foundation
import SwiftUI

struct StarFieldView: View {
    @State private var animate = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<50, id: \.self) { _ in
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 2, height: 2)
                        .position(
                            x: CGFloat.random(in: 0...geometry.size.width),
                            y: animate ? CGFloat.random(in: 0...geometry.size.height) : 0
                        )
                }
            }
            .onAppear {
                withAnimation(.linear(duration: 10).repeatForever(autoreverses: false)) {
                    animate = true
                }
            }
        }
        .background(Color.black)
    }
}

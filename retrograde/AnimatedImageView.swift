//
//  File.swift
//  retrograde
//
//  Created by Anna Kallenborn-Bolden on 8/24/24.
//

import Foundation
import SwiftUI
import UIKit

struct AnimatedImageView: UIViewRepresentable {
    let imageName: String
    
    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: imageName)
        imageView.startAnimating()
        return imageView
    }
    
    func updateUIView(_ uiView: UIImageView, context: Context) {
        // No update needed as the GIF will loop automatically
    }
}

//
//  UIImage+Extensions.swift
//  LoginTest
//
//  Created by Luiz Felipe Trindade on 21/08/24.
//

import Foundation
import UIKit


extension UIImage {
    func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
        // Determine the scale factor that preserves aspect ratio
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        
        let scaleFactor = min(widthRatio, heightRatio)
        
        // Compute the new image size that preserves aspect ratio
        let scaledImageSize = CGSize(
            width: size.width * scaleFactor,
            height: size.height * scaleFactor
        )

        // Draw and return the resized UIImage
        let renderer = UIGraphicsImageRenderer(
            size: scaledImageSize
        )

        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(
                origin: .zero,
                size: scaledImageSize
            ))
        }
        
        return scaledImage
    }
    func with(_ insets: UIEdgeInsets) -> UIImage {
          let targetWidth = size.width + insets.left + insets.right
          let targetHeight = size.height + insets.top + insets.bottom
          let targetSize = CGSize(width: targetWidth, height: targetHeight)
          let targetOrigin = CGPoint(x: insets.left, y: insets.top)
          let format = UIGraphicsImageRendererFormat()
          format.scale = scale
          let renderer = UIGraphicsImageRenderer(size: targetSize, format: format)
          return renderer.image { _ in
              draw(in: CGRect(origin: targetOrigin, size: size))
          }.withRenderingMode(renderingMode)
      }
    
}


extension UIImageView {
  func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
  }
}

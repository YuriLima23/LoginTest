//
//  CurvedView.swift
//  LoginTest
//
//  Created by Luiz Felipe Trindade on 25/09/24.
//

import Foundation
import UIKit
class CurvedView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        self.backgroundColor = UIColor.skyblue // Cor de fundo para visualizar
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        applyCurve()
    }

    private func applyCurve() {
        let path = UIBezierPath()

            let height: CGFloat = 86.0
            let PI = 3.14
        let width = self.frame.width
           let centerWidth = width / 2
           path.move(to: CGPoint(x: 0, y: 0))
           path.addLine(to: CGPoint(x: (centerWidth - (height/2)), y: 0))
        path.addArc(withCenter: CGPoint(x: centerWidth, y: -self.frame.height / 2), radius: width / 1.58, startAngle: 180 * CGFloat(PI)/180, endAngle: 0, clockwise: false)
           path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
           path.addLine(to: CGPoint(x: 0, y: self.frame.height))
           path.stroke()
           path.close()
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

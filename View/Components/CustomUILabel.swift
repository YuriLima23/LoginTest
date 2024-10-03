//
//  CustomUILabel.swift
//  LoginTest
//
//  Created by Luiz Felipe Trindade on 30/08/24.
//

import UIKit

class CustomUILabel: UILabel {

    private var selected : Bool? = false
    required override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
    }
    
    init(_ text: String, selected: Bool? = false ){
        super.init(frame: .zero)
        setupView(text, selected: selected)
    }
    private lazy var bottomLine : CALayer = {
        let layer = CALayer()
        layer.backgroundColor = UIColor.blue100.cgColor
        return layer
    }()
    
    func setupView(_ text: String, selected: Bool?) {
        self.text = text
        self.selected = selected
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setDefaultFont(25)
       
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        if(self.selected != nil && self.selected != false){
            self.textColor = UIColor.blue200
            bottomLine.frame = CGRect(x: 0, y: self.frame.height + 1 , width: self.frame.width + 1, height: 2)
        }
        
    }
   
    
}

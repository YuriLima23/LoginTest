//
//  UILabel+Extensions.swift
//  LoginTest
//
//  Created by Luiz Felipe Trindade on 16/08/24.
//

import Foundation
import UIKit



extension UILabel {
    func halfTextColorChange (fullText : String , changeText : String ) {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString(string: fullText);
        attribute.setAttributes([NSAttributedString.Key.foregroundColor: UIColor.blue200], range: range)
        self.attributedText = attribute
    }
    
    func setDefaultFont(_ size: CGFloat){
        self.font = UIFont(name: "majalla", size: size)
        self.adjustsFontForContentSizeCategory = true
    }
    
}



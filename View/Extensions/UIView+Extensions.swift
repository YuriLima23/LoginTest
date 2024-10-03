//
//  UIView+Extensions.swift
//  LoginTest
//
//  Created by Luiz Felipe Trindade on 16/08/24.
//

import Foundation
import UIKit


extension UIView {
    func setConstraintsToParent(_ parent: UIView){
        NSLayoutConstraint.activate(([
            self.topAnchor.constraint(equalTo: parent.topAnchor),
            self.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            self.bottomAnchor.constraint(equalTo: parent.bottomAnchor),
            self.trailingAnchor.constraint(equalTo: parent.trailingAnchor)
        ]))
    }
    
    func setDinamicContraints(_ parent: AnyObject, top: CGFloat? , left:CGFloat?, bottom: CGFloat?, right: CGFloat?, width: CGFloat?, height: CGFloat?){
      
        var constraints: [NSLayoutConstraint] = []

        if(top != nil){
            constraints.append(self.topAnchor.constraint(equalTo: parent.topAnchor, constant: top!))
        }
        
        if(left != nil){
            constraints.append(self.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: left!))
        }
        if(right != nil){
            constraints.append(self.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: right!))
        }
        
        if(bottom != nil){
            constraints.append(self.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: bottom!))
        }
         if(width != nil){
            constraints.append(self.widthAnchor.constraint(equalToConstant: width! ))
        }
        if(height != nil){
           constraints.append(self.heightAnchor.constraint(equalToConstant: height! ))
       }
        
        NSLayoutConstraint.activate(constraints)
        
        
    }
    
}



//
//  CustomUITextField.swift
//  LoginTest
//
//  Created by Luiz Felipe Trindade on 22/08/24.
//

import UIKit

class CustomUITextField: UITextField , UITextFieldDelegate{

    private var leftImageName : String?
    private var rightImageName : String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    init(placeholder: String, leftImageName: String?, rightImageName: String? ){
        super.init(frame: .zero)
        self.placeholder = placeholder
        self.leftImageName = leftImageName
        self.rightImageName = rightImageName
        self.delegate = self
        
        setup()
    }
    private lazy var iconLeft: UIImageView = {
        let imageView = UIImageView()
        let image  = UIImage(named: self.leftImageName!)?.with(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
  
        imageView.setImageColor(color: UIColor.lightGray!)
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return imageView
    }() 
    
    private lazy var iconRight: UIImageView = {
        let imageView = CustomUIImageView {
            self.hiddenShowPassword()
        }
        let image  = UIImage(named: self.rightImageName!)?.with(UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = image
      
        imageView.setImageColor(color: UIColor.lightGray!)
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        return imageView
    }()
    
    func hiddenShowPassword(){
        self.isSecureTextEntry = !self.isSecureTextEntry
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        
        
    }
    private lazy var bottomLine: CALayer = {
        let line = CALayer()
        line.backgroundColor = UIColor.lightGray?.cgColor
        return line
    }()
    func setup(){
        self.textInputView.translatesAutoresizingMaskIntoConstraints = false
        self.borderStyle = .none
        self.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
 
        
        if(self.leftImageName != nil){
            self.leftViewMode = .always
            self.leftView = iconLeft
        }
        
        if(self.rightImageName != nil){
            self.rightViewMode = .always
            self.rightView = iconRight

        }
        self.layer.addSublayer(bottomLine)
        self.layer.masksToBounds = true
            

    }
    

    
    override func layoutSubviews() {
           super.layoutSubviews()
           bottomLine.frame = CGRect(x: 0, y: self.frame.height - 2, width: self.frame.width, height: 2)
       }
    
}

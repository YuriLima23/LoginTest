//
//  Checkbox.swift
//  LoginTest
//
//  Created by Luiz Felipe Trindade on 29/08/24.
//

import UIKit

class Checkbox: UIButton {

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder : NSCoder) {
        super.init(coder: coder)
    }
    
    
    private lazy var title : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.mossGray
        label.text = "Remember Password"
        label.font = UIFont(name: "majalla", size:2)
        
        return label
    }()
 
    func setupView (){
        self.backgroundColor = .white
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.borderColor =  UIColor.dustyRose!.cgColor
        self.layer.borderWidth = 2
        self.addSubview(title)
        
        setConstraints()
        setActions()

    }
    
    func setConstraints(){
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: 21),
            self.heightAnchor.constraint(equalToConstant: 21),
            title.leadingAnchor.constraint(equalTo: self.trailingAnchor, constant: 5),
            title.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    } 
    
    func setActions(){
        self.addTarget(self, action: #selector(setSelected(sender:)), for: .touchUpInside)
    }
  
    @IBAction func setSelected (sender : UIButton){
        let imageName = sender.currentImage == nil ? UIImage(named: "checked") : nil
        sender.setImage(imageName, for: .normal)
    }
    
 
    
}

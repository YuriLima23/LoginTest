//
//  ViewController.swift
//  LoginTest
//
//  Created by Luiz Felipe Trindade on 14/08/24.
//

import UIKit
import SwiftUI
class LoginController: UIViewController {
    
    private var statusNavigate: Bool = false {
        didSet {
            print(statusNavigate)
            if (statusNavigate){
                labelRegister.textColor = UIColor.blue100
                labelLogin.textColor = UIColor.lightGray
                
            }else{
                labelLogin.textColor = UIColor.blue100
                labelRegister.textColor = UIColor.lightGray
            }
        }
    }
    
    
    private lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login"
        label.setDefaultFont(50)
        label.font.withSize(60)
        label.textAlignment = .center
        label.textColor = UIColor.black
        
        return label
    }()
    
    private lazy var labelSubtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textColor = UIColor.mossGray
        label.halfTextColorChange(fullText: "By signing in you are agreeing \n our Term and privacy policy"
                                  , changeText: "our Term and privacy policy")
        label.setDefaultFont(25)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var labelLogin: CustomUILabel = {
        print(statusNavigate)
        let label = CustomUILabel("Login", selected: true)
        return label
    }()
    private lazy var labelRegister: CustomUILabel = {
        let label = CustomUILabel("Register")
        return label
    }()
    
    
    
    
    private lazy var stackViewLoginRegister: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [labelLogin, labelRegister])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 30
        return stackView
    }()
    private lazy var textFieldEmail = CustomUITextField(placeholder: "Email address", leftImageName: "email", rightImageName: nil)
    private lazy var textFieldPassword = CustomUITextField(placeholder: "Password", leftImageName: "lock", rightImageName: "eye")
    private lazy var stackViewInputEmail: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textFieldEmail])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    private lazy var stackViewInputPassword: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [textFieldPassword])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        return stackView
    }()
    
    private lazy var checkbox = Checkbox()
    
    
    private lazy var forgetPasswordLabel : UILabel = {
        let label = UILabel()
        label.text = "Forget Password"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setDefaultFont(21)
        label.textColor = UIColor.oceanBlue
        return label
    }()
    
    private lazy var stackViewForgotPassword: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [checkbox, forgetPasswordLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center  // Align the items vertically centered
        
        stackView.distribution = .equalSpacing  // Ensure both elements take the needed space
        
        return stackView
    }()
    
    private lazy var ButtonLogin : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.blue200
        button.titleLabel?.textColor = UIColor.white
        button.setTitle("Login", for: .normal)
        return button
    }()
    
    private lazy var stackConnectWith: UIStackView = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.mossGray
        label.text = "Or connect with"
        label.setDefaultFont(25)
        label.textAlignment = .center
        
        let stackView = UIStackView(arrangedSubviews: [label])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        return stackView
        
    }()
    private lazy var stackIcons: UIStackView = {
        let facebook = UIImage(named:"facebookIcon")
        let linkeding = UIImage(named:"linkedingIcon")
        let instagran = UIImage(named:"instagranIcon")
        let pinterest = UIImage(named:"pinterestIcon")
        
        
        
        let facebookImage = UIImageView(image: facebook)
        let linkedingImage = UIImageView(image: linkeding)
        let instagranImage = UIImageView(image: instagran)
        let pinterestImage = UIImageView(image: pinterest)
        
        [facebookImage, linkedingImage, instagranImage, pinterestImage].forEach { imageView in
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.contentMode = .scaleAspectFit
            imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
            imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
            
        }
        
        let stackView = UIStackView(arrangedSubviews: [facebookImage, instagranImage, pinterestImage, linkedingImage])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 15 // Add space between the icons
        stackView.alignment = .center
        stackView.distribution = .equalCentering // All icons take up the same space
        return stackView
        
    }()
    
    private lazy var footerImageView : UIImageView = {
        let imageView = UIImageView(image: UIImage(named:"footerImage"))
        imageView.translatesAutoresizingMaskIntoConstraints  = false
        
        return imageView
    }()
    private lazy var fingerprintImageView : UIImageView = {
        let imageView = UIImageView(image: UIImage(named:"fingerprint"))
        imageView.translatesAutoresizingMaskIntoConstraints  = false
        return imageView
    }()
    private lazy var squareView : CurvedView = {
        let view = CurvedView()
        view.translatesAutoresizingMaskIntoConstraints  = false
        return view
    }()
    
    private lazy var labelLoginTouch: CustomUILabel = {
        let label = CustomUILabel("Login with touch")
        label.textColor = UIColor.white
        
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    override func viewDidLayoutSubviews() {
    }
    
    func setupView(){
        view.backgroundColor = .white
        let tapGestureBackground = UITapGestureRecognizer(target: self, action: #selector(self.backgroundTapped))
        self.view.addGestureRecognizer(tapGestureBackground)
        setHierarquy()
        setConstraints()
        let tapGestureNavigation = UITapGestureRecognizer(target: self, action: #selector(self.navigateTo))
        let tapGestureNavigationRegister = UITapGestureRecognizer(target: self, action: #selector(self.navigateTo))
        labelRegister.addGestureRecognizer(tapGestureNavigationRegister)
        labelLogin.addGestureRecognizer(tapGestureNavigation)
        
        
    }
    
    
    @objc func navigateTo(){
        print("CHANGE")
        return statusNavigate.toggle()
    }
    
    @objc func backgroundTapped()
    {
        textFieldEmail.endEditing(true)
        textFieldPassword.endEditing(true)
    }
    func setHierarquy(){
        view.addSubview(labelTitle)
        view.addSubview(labelSubtitle)
        view.addSubview(stackViewLoginRegister)
        view.addSubview(stackViewInputEmail)
        view.addSubview(stackViewInputPassword)
        view.addSubview(stackViewForgotPassword)
        
        view.addSubview(ButtonLogin)
        view.addSubview(stackConnectWith)
        view.addSubview(stackIcons)
        view.addSubview(footerImageView)
        view.addSubview(squareView)
        view.addSubview(fingerprintImageView)
        view.sendSubviewToBack(footerImageView)
        view.addSubview(labelLoginTouch)
        
    }
    
    func setConstraints(){
        
        labelTitle.setDinamicContraints(view.safeAreaLayoutGuide, top: 49, left: 50, bottom: nil, right: -50, width: nil, height: nil)
        
        
        
        labelSubtitle.setDinamicContraints(view.safeAreaLayoutGuide, top: 59, left: 10, bottom: nil, right: -10, width: nil, height: 72)
        
        
        NSLayoutConstraint.activate([
            stackViewLoginRegister.topAnchor.constraint(equalTo: labelSubtitle.bottomAnchor, constant: 10),
            stackViewLoginRegister.centerXAnchor.constraint(equalTo: labelSubtitle.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            
            stackViewInputEmail.topAnchor.constraint(equalTo: stackViewLoginRegister.bottomAnchor, constant: 50),
            stackViewInputEmail.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            stackViewInputEmail.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
        ])
        NSLayoutConstraint.activate([
            stackViewInputPassword.topAnchor.constraint(equalTo: stackViewInputEmail.bottomAnchor, constant: 50),
            stackViewInputPassword.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            stackViewInputPassword.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
        ])
        
        NSLayoutConstraint.activate([
            stackViewForgotPassword.topAnchor.constraint(equalTo: stackViewInputPassword.bottomAnchor, constant: 25),
            checkbox.leftAnchor.constraint(equalTo: textFieldPassword.leftAnchor),
            forgetPasswordLabel.rightAnchor.constraint(equalTo: textFieldPassword.rightAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            ButtonLogin.topAnchor.constraint(equalTo: stackViewForgotPassword.safeAreaLayoutGuide.bottomAnchor, constant: 50),
            ButtonLogin.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            ButtonLogin.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            stackConnectWith.topAnchor.constraint(equalTo: ButtonLogin.bottomAnchor, constant:25),
            stackConnectWith.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            stackConnectWith.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
        
        
        NSLayoutConstraint.activate([
            stackIcons.topAnchor.constraint(equalTo: stackConnectWith.bottomAnchor, constant:25),
            stackIcons.centerXAnchor.constraint(equalTo: stackConnectWith.centerXAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            footerImageView.topAnchor.constraint(equalTo: stackConnectWith.bottomAnchor, constant:20),
            footerImageView.centerXAnchor.constraint(equalTo: stackConnectWith.centerXAnchor),
            footerImageView.widthAnchor.constraint(equalToConstant: 360),
            footerImageView.heightAnchor.constraint(equalToConstant: 312),
            
            
            squareView.topAnchor.constraint(equalTo: stackIcons.bottomAnchor),
            squareView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            squareView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            squareView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            fingerprintImageView.widthAnchor.constraint(equalToConstant: 69),
            fingerprintImageView.heightAnchor.constraint(equalToConstant: 72),
            fingerprintImageView.centerXAnchor.constraint(equalTo: squareView.centerXAnchor),
            fingerprintImageView.centerYAnchor.constraint(equalTo: squareView.centerYAnchor, constant: 30),
            
            
            labelLoginTouch.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            labelLoginTouch.topAnchor.constraint(equalTo: fingerprintImageView.bottomAnchor, constant: 10)
            
        ])
        
        
        
        
        
        
        
    }
    
    
}


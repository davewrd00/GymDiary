//
//  WelcomeViewController.swift
//  GymDiary
//
//  Created by David on 15/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class WelcomeViewController: UIViewController {
  
  let textView: UILabel = {
    let tv = UILabel()
    tv.textColor = .white
    tv.font = UIFont(name: "HelveticaNeue-Bold", size: 40)
    tv.numberOfLines = 0
    let attributedTitle = NSMutableAttributedString(string: "Gym Diary", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 44), NSAttributedStringKey.foregroundColor: UIColor.white])
    tv.backgroundColor = .clear
    tv.attributedText = attributedTitle
    tv.translatesAutoresizingMaskIntoConstraints = false
    return tv
  }()
  
  let loginButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    let attributedText = NSMutableAttributedString(string: "Login", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20), NSAttributedStringKey.foregroundColor: UIColor.white])
    button.setAttributedTitle(attributedText, for: .normal)
    button.layer.cornerRadius = 8
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    button.layer.borderColor = UIColor.white.cgColor
    button.layer.borderWidth = 2
    return button
  }()
  
  let signUpButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    let attributedText = NSMutableAttributedString(string: "Sign Up", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20), NSAttributedStringKey.foregroundColor: UIColor.white])
    button.setAttributedTitle(attributedText, for: .normal)
    button.addTarget(self, action: #selector(handleSignUp), for: .touchUpInside)
    button.layer.cornerRadius = 8
    button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
    button.layer.borderWidth = 2
    button.layer.borderColor = UIColor.white.cgColor
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    createGradient()
    setupViews()
    
  }
  
  override func viewWillAppear(_ animated: Bool) {
    self.navigationController?.isNavigationBarHidden = true
  }
  
  fileprivate func createGradient() {
    var gradientLayer = CAGradientLayer()
    gradientLayer.frame = self.view.bounds
    gradientLayer.colors = [UIColor.rgb(red: 69, green: 83, blue: 111).cgColor, UIColor.rgb(red: 116, green: 116, blue: 191).cgColor]
    view.layer.addSublayer(gradientLayer)
  }
  
  fileprivate func setupViews() {
    
    view.addSubview(textView)
    view.addSubview(loginButton)
    view.addSubview(signUpButton)
    
    textView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, paddingTop: 30, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    
    loginButton.anchor(top: nil, left: nil, bottom: signUpButton.topAnchor, right: nil, paddingTop: 50, paddingLeft: 0, paddingBottom: 10, paddingRight: 0, width: 300, height: 50)
    loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    signUpButton.anchor(top: nil, left: nil, bottom: view.bottomAnchor, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 30, paddingRight: 0, width: 300, height: 50)
    signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
  }
  
  @objc fileprivate func handleLogin() {
    let loginVC = LoginViewController()
    self.present(loginVC, animated: true, completion: nil)
  }
  
  @objc fileprivate func handleSignUp() {
    let registerVC = RegistrationViewController()
    self.present(registerVC, animated: true, completion: nil)
  }
  
}

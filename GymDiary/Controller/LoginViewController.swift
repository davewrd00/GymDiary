//
//  LoginViewController.swift
//  GymDiary
//
//  Created by David on 15/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class LoginViewController: UIViewController, UITextFieldDelegate {
  
  let emailTextField: UITextField = {
    let tf = UITextField()
    
    tf.leftViewMode = UITextFieldViewMode.always
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    let image = UIImage(named: "username")
    imageView.image = image
    tf.leftView = imageView
    
    tf.backgroundColor = .clear
    tf.textColor = .white
    tf.attributedPlaceholder = NSAttributedString(string: "   USERNAME", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 20), NSAttributedStringKey.foregroundColor: UIColor.white])
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.layer.borderColor = UIColor.white.cgColor
    tf.layer.borderWidth = 2
    tf.layer.cornerRadius = 8
    tf.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
    return tf
  }()
  
  let passwordTextField: UITextField = {
    let tf = UITextField()
    
    tf.leftViewMode = UITextFieldViewMode.always
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    let image = UIImage(named: "password")
    imageView.image = image
    tf.leftView = imageView
    
    tf.backgroundColor = .clear
    tf.textColor = .white
    tf.isSecureTextEntry = true
    tf.attributedPlaceholder = NSAttributedString(string: "   PASSWORD", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 20), NSAttributedStringKey.foregroundColor: UIColor.white])
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.layer.borderColor = UIColor.white.cgColor
    tf.layer.borderWidth = 2
    tf.layer.cornerRadius = 8
    tf.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
    return tf
  }()
  
  let switchToRegisterView: UIButton = {
    let button = UIButton()
    button.backgroundColor = .clear
    button.translatesAutoresizingMaskIntoConstraints = false
    let attributedText = NSMutableAttributedString(string: "Not registered? ", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18), NSAttributedStringKey.foregroundColor: UIColor.white])
    attributedText.append(NSMutableAttributedString(string: "Register now!", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18), NSAttributedStringKey.foregroundColor: UIColor.red]))
    button.setAttributedTitle(attributedText, for: .normal)
    button.addTarget(self, action: #selector(switchToWelcomeView), for: .touchUpInside)
    return button
  }()
  
  let loginButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = UIColor.rgb(red: 94, green: 186, blue: 125)
    let attributedText = NSMutableAttributedString(string: "LOGIN", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 20), NSAttributedStringKey.foregroundColor: UIColor.white])
    button.setAttributedTitle(attributedText, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.layer.cornerRadius = 25
    button.layer.borderWidth = 2
    button.layer.borderColor = UIColor.white.cgColor
    button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    createGradient()
    
    emailTextField.delegate = self
    passwordTextField.delegate = self
    setupViews()
    
  }
  
  fileprivate func createGradient() {
    var gradientLayer = CAGradientLayer()
    gradientLayer.frame = self.view.bounds
    gradientLayer.colors = [UIColor.rgb(red: 69, green: 83, blue: 111).cgColor, UIColor.rgb(red: 116, green: 116, blue: 191).cgColor]
    view.layer.addSublayer(gradientLayer)
  }
  
  @objc func handleLogin() {
    print(123)
    if let email = emailTextField.text, let password = passwordTextField.text {
      Auth.auth().signIn(withEmail: email, password: password, completion: { (user, err) in
        if err == nil {
          print("Users email authengicated with Firebase")
          if let user = user {
            self.completeSignIn(id: user.uid)
          }
        } else {
          print("There has been some sort of error - unable to authenticate user with Firebase")
          return
        }
      })
    }
  }
  
  func completeSignIn(id: String) {
    let keychainResult = KeychainWrapper.standard.set(id, forKey: "uid")
    print("DAVID: Data saved to keychain \(keychainResult)")
    let homeVC = HomeViewController()
    let navigationController = UINavigationController(rootViewController: homeVC)
    self.present(navigationController, animated: true, completion: nil)
  }
  
  @objc func switchToWelcomeView() {
    print(123)
    let registerVC = RegistrationViewController()
    self.present(registerVC, animated: true, completion: nil)
  }
  
  fileprivate func setupViews() {
    view.addSubview(emailTextField)
    view.addSubview(passwordTextField)
    view.addSubview(switchToRegisterView)
    view.addSubview(loginButton)
    
    emailTextField.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 100, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 300, height: 50)
    emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    passwordTextField.anchor(top: emailTextField.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 300, height: 50)
    passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    loginButton.anchor(top: passwordTextField.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 300, height: 50)
    loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    switchToRegisterView.anchor(top: nil, left: nil, bottom: view.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 30, paddingRight: 0, width: 300, height: 50)
    switchToRegisterView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    
    
  }
  
}

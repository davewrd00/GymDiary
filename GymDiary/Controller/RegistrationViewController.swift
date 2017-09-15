//
//  RegistrationViewController.swift
//  GymDiary
//
//  Created by David on 15/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit
import Firebase

class RegistrationViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
  
  let plusPhotoButton: UIButton = {
    let btn = UIButton(type: .system)
    btn.setImage(#imageLiteral(resourceName: "plus_photo").withRenderingMode(.alwaysOriginal), for: .normal)
    btn.imageView?.contentMode = .scaleAspectFill
    btn.translatesAutoresizingMaskIntoConstraints = false
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
    btn.addTarget(self, action: #selector(handlePlusPhoto), for: .touchUpInside)
    return btn
  }()
  
  let nameTextField: UITextField = {
    let tf = UITextField()
    tf.leftViewMode = UITextFieldViewMode.always
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    let image = UIImage(named: "name")
    imageView.image = image
    tf.leftView = imageView
    tf.backgroundColor = .clear
    tf.textColor = .white
    tf.attributedPlaceholder = NSAttributedString(string: "   NAME", attributes: [NSAttributedStringKey.font: UIFont(name: "HelveticaNeue-Bold", size: 20), NSAttributedStringKey.foregroundColor: UIColor.white])
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.layer.borderColor = UIColor.white.cgColor
    tf.layer.borderWidth = 1
    tf.layer.cornerRadius = 8
    tf.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
    tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
    return tf
  }()
  
  let emailTextField: UITextField = {
    let tf = UITextField()
    tf.leftViewMode = UITextFieldViewMode.always
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
    let image = UIImage(named: "username")
    imageView.image = image
    tf.leftView = imageView
    tf.backgroundColor = .clear
    tf.textColor = .white
    tf.attributedPlaceholder = NSAttributedString(string: "   EMAIL", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 20), NSAttributedStringKey.foregroundColor: UIColor.white])
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.layer.borderColor = UIColor.white.cgColor
    tf.layer.borderWidth = 2
    tf.layer.cornerRadius = 8
    tf.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
    tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
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
    tf.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
    return tf
  }()
  
  let signupButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = UIColor.rgb(red: 94, green: 186, blue: 125)
    let attributedText = NSMutableAttributedString(string: "SIGN UP", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 20), NSAttributedStringKey.foregroundColor: UIColor.white])
    button.setAttributedTitle(attributedText, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.layer.cornerRadius = 25
    button.layer.borderWidth = 2
    button.layer.borderColor = UIColor.white.cgColor
    button.isEnabled = false
    button.addTarget(self, action: #selector(handleRegistration), for: .touchUpInside)
    return button
  }()
  
  let swicthToLoginButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .clear
    button.translatesAutoresizingMaskIntoConstraints = false
    let attributedText = NSMutableAttributedString(string: "Alread have an account? ", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18), NSAttributedStringKey.foregroundColor: UIColor.white])
    attributedText.append(NSMutableAttributedString(string: "Login", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 18), NSAttributedStringKey.foregroundColor: UIColor.red]))
    button.setAttributedTitle(attributedText, for: .normal)
    button.addTarget(self, action: #selector(switchToWelcomeView), for: .touchUpInside)
    return button
  }()
  
  @objc func handlePlusPhoto() {
    print(123)
    
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = self
    imagePickerController.allowsEditing = true
    
    present(imagePickerController, animated: true, completion: nil)
  
  }
  
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    if let editedImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
      plusPhotoButton.setImage(editedImage.withRenderingMode(.alwaysOriginal), for: .normal)
    } else if let originalImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
      plusPhotoButton.setImage(originalImage.withRenderingMode(.alwaysOriginal), for: .normal)
    }
    
    plusPhotoButton.layer.cornerRadius = plusPhotoButton.frame.width / 2
    plusPhotoButton.layer.masksToBounds = true
    plusPhotoButton.layer.borderColor = UIColor.black.cgColor
    plusPhotoButton.layer.borderWidth = 3
    
    dismiss(animated: true, completion: nil)
  }
  
  @objc func handleTextInputChange() {
    print(123)
    let isFormValid = emailTextField.text?.characters.count ?? 0 > 0 && nameTextField.text?.characters.count ?? 0 > 0 && passwordTextField.text?.characters.count ?? 0 > 0
    
    if isFormValid {
      signupButton.isEnabled = true
      signupButton.backgroundColor = UIColor.rgb(red: 94, green: 186, blue: 125)
    } else {
      signupButton.isEnabled = false
      signupButton.backgroundColor = UIColor.rgb(red: 149, green: 204, blue: 244)
    }
  }
  
  @objc func handleRegistration() {
    print(123)
    guard let email = emailTextField.text, email.characters.count > 0 else { return }
    guard let name = nameTextField.text, name.characters.count > 0 else { return }
    guard let password = passwordTextField.text, password.characters.count > 0 else { return }
    
    Auth.auth().createUser(withEmail: email, password: password) { (user, err) in
      if let _ = err {
        print("Unable to create a new user")
        return
      }
      print("Succcessfully been able to create a new user", user?.uid ?? "")
      
      guard let image = self.plusPhotoButton.imageView?.image else { return }
      
      guard let uploadData = UIImageJPEGRepresentation(image, 0.3) else { return }
      
      DataService.sharedInstance.saveImageToFirebaseStorage(uploadData: uploadData, imageLocation: "profile_images", completionBlock: { (string) in
        print("Successfully been able to save user profile pic in storage")
        
        guard let uid = user?.uid else { return }
        
        let dictionaryValues: [String: Any] = ["name": name,
                                               "profileImageURL": string]
        let values = [uid: dictionaryValues]
        
        Database.database().reference().child("users").updateChildValues(values, withCompletionBlock: { (err, ref) in
          if let err = err {
            print("Failed to save user info to DB:", err)
            return
          }
          print("Successfully saved the newly registered user into the DB")
          
          // For now, lets just segue to the new blue screen that is the home screen
          let homeVC = HomeViewController()
          self.present(homeVC, animated: true, completion: nil)
        })
        
        
      })
    }
  }
  
  @objc func switchToWelcomeView() {
    print(123)
    let loginVC = LoginViewController()
    self.present(loginVC, animated: true, completion: nil)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    navigationController?.isNavigationBarHidden = true
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    createGradient()
    
    view.addSubview(plusPhotoButton)
    view.addSubview(nameTextField)
    view.addSubview(emailTextField)
    view.addSubview(passwordTextField)
    view.addSubview(signupButton)
    view.addSubview(swicthToLoginButton)
    
    plusPhotoButton.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 40, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 150)
    plusPhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    nameTextField.anchor(top: plusPhotoButton.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 300, height: 50)
    nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    emailTextField.anchor(top: nameTextField.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 300, height: 50)
    emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    passwordTextField.anchor(top: emailTextField.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 300, height: 50)
    passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    signupButton.anchor(top: passwordTextField.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 300, height: 50)
    signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
    swicthToLoginButton.anchor(top: nil, left: nil, bottom: view.bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 30, paddingRight: 0, width: 300, height: 50)
    swicthToLoginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
  }
  
  fileprivate func createGradient() {
    var gradientLayer = CAGradientLayer()
    gradientLayer.frame = self.view.bounds
    gradientLayer.colors = [UIColor.rgb(red: 69, green: 83, blue: 111).cgColor, UIColor.rgb(red: 116, green: 116, blue: 191).cgColor]
    view.layer.addSublayer(gradientLayer)
  }
  
}

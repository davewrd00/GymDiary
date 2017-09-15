//
//  ViewController.swift
//  GymDiary
//
//  Created by David on 13/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit
import Firebase
import SwiftKeychainWrapper

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  var user: User? {
    didSet {
      guard let name = user?.name else { return }
      print("The usernames name is \(name)")
      guard let imageUrl = user?.profileImageUrl else { return }
      self.topView.userProfileView.loadImage(urlString: imageUrl)
      self.topView.userNameLabel.text = user?.name
    }
  }
  
  let topView: HomeHeaderCell = {
    let v = HomeHeaderCell()
    return v
  }()
  
  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.backgroundColor = .yellow
    return cv
  }()
  
  let startButton: UIButton = {
    let btn = UIButton()
    btn.backgroundColor = UIColor.rgb(red: 126, green: 211, blue: 31)
    btn.setTitle("Start workout", for: .normal)
    let flagImage = UIImage(named: "flag")
    btn.setImage(flagImage?.withRenderingMode(.alwaysOriginal), for: .normal)
    btn.addTarget(self, action: #selector(handleStartWorkout), for: .touchUpInside)
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10)
    return btn
  }()
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PreviousWorkoutView
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: view.frame.height)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    self.navigationController?.isNavigationBarHidden = false
  }


  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.register(PreviousWorkoutView.self, forCellWithReuseIdentifier: "cellId")
    collectionView.delegate = self
    collectionView.dataSource = self
    
    self.navigationController?.isNavigationBarHidden = false
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(hanleMenuBtnTapped))
    navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 69, green: 83, blue: 111)
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "weight").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleWorkoutsBtnTapped))

    view.backgroundColor = UIColor.rgb(red: 69, green: 83, blue: 111)
    
    view.addSubview(topView)
    view.addSubview(startButton)
    view.addSubview(collectionView)
    
    topView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 64, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 200)
    startButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 70)
    
    collectionView.anchor(top: topView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 200)
    
    fetchUser()
  }
  
  @objc func handleStartWorkout() {
    print(123)
  }
  
  @objc func handleWorkoutsBtnTapped() {
    print(345)
    
    let layout = UICollectionViewFlowLayout()
    let createWorkoutVC = CreateWorkoutViewController(collectionViewLayout: layout)
    self.navigationController?.pushViewController(createWorkoutVC, animated: true)
    
  }
  
  @objc func hanleMenuBtnTapped() {
    print(234)
    
    let alertController = UIAlertController(title: "Log Out", message: "Are you sure?", preferredStyle: .actionSheet)
    alertController.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { (_) in
      
      do {
        try Auth.auth().signOut()
        let welcomeVC = WelcomeViewController()
        let navController = UINavigationController(rootViewController: welcomeVC)
        _ = KeychainWrapper.standard.removeObject(forKey: "uid")
        print("ID removed from keychain")
        self.present(navController, animated: true, completion: nil)
        
      } catch let signOutErr {
        print("Failed to signout of application", signOutErr)
      }
    }))
    alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil ))
    present(alertController, animated: true, completion: nil)
  }
  
  fileprivate func fetchUser() {
    guard let uid = Auth.auth().currentUser?.uid else { return }
    DataService.sharedInstance.fetchUserWithUID(uid: uid) { (user) in
      self.user = user
      print("The logged in user is \(user)")
    }
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }

}


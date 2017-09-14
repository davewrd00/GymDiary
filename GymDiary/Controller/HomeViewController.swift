//
//  ViewController.swift
//  GymDiary
//
//  Created by David on 13/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
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


  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.register(PreviousWorkoutView.self, forCellWithReuseIdentifier: "cellId")
    collectionView.delegate = self
    collectionView.dataSource = self
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(hanleMenuBtnTapped))
    navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 69, green: 83, blue: 111)
    
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "weight").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleWorkoutsBtnTapped))

    view.backgroundColor = UIColor.rgb(red: 69, green: 83, blue: 111)
    
    view.addSubview(topView)
    view.addSubview(startButton)
    view.addSubview(collectionView)
    
    topView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 64, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 200)
    startButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 80)
    
    collectionView.anchor(top: topView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: view.frame.width, height: 200)
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
  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }

}


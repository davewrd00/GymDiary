//
//  ExerciseDetailViewController.swift
//  GymDiary
//
//  Created by David on 18/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit

class ExerciseDetailViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  var cellId = "cellId"
  
  let weightsNumberCellId = "WeighsNumberCellId"
  
  let repsNumberCellId = "repsNumberCellId"
  
  var exerciseChosen: String?
  
  lazy var menuBar: CollectionViewMenuBar = {
    let cvb = CollectionViewMenuBar()
    cvb.exerciseDetailVC = self
    return cvb
  }()
  
  var addExerciseButton: UIButton = {
    let btn = UIButton()
    btn.setTitle("Add exercise", for: .normal)
    btn.setTitleColor(UIColor.white, for: .normal)
    btn.titleLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
    let image = UIImage(named: "add")
    btn.setImage(image?.withRenderingMode(.alwaysOriginal), for: .normal)
    btn.backgroundColor = .green
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 8)
    return btn
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(addExerciseButton)
    addExerciseButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 60)
    
    self.title = exerciseChosen
    tabBarController?.tabBar.isHidden = true
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "cross").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(dismissViewController))
    
    setupMenuBar()
    setupCollectionView()
  
  }
  
  func setupCollectionView() {
    if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
      flowLayout.scrollDirection = .horizontal
      flowLayout.minimumLineSpacing = 0
    }
    collectionView?.backgroundColor = UIColor.rgb(red: 69, green: 83, blue: 111)
    
    collectionView?.register(SetsCellView.self, forCellWithReuseIdentifier: cellId)
    collectionView?.register(SetsWeightNumberView.self, forCellWithReuseIdentifier: weightsNumberCellId)
    collectionView?.register(SetRepsNumberView.self, forCellWithReuseIdentifier: repsNumberCellId)

    collectionView?.contentInset = UIEdgeInsetsMake(235, 0, 0, 0)
    collectionView?.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0)
    
    collectionView?.isPagingEnabled = true
  }
  
  func scrollToMenuIndex(menuIndex: Int) {
    let indexPath = IndexPath(item: menuIndex, section: 0)
    collectionView?.scrollToItem(at: indexPath, at: [], animated: true)
  }
  
  override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
    let index = targetContentOffset.pointee.x / view.frame.width
    let indexPath = IndexPath(item: Int(index), section: 0)
    menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    if indexPath.item == 1 {
      return collectionView.dequeueReusableCell(withReuseIdentifier: weightsNumberCellId, for: indexPath)
    } else if indexPath.item == 2 {
      return collectionView.dequeueReusableCell(withReuseIdentifier: repsNumberCellId, for: indexPath)
    }
 
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)

    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: view.frame.height)
  }
  
  @objc func dismissViewController() {
    self.navigationController?.popViewController(animated: true)
  }
  
  override func scrollViewDidScroll(_ scrollView: UIScrollView) {
    menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 3
  }
  
  fileprivate func setupMenuBar() {
    navigationController?.hidesBarsOnSwipe = true 
    let redView = UIView()
    redView.backgroundColor = UIColor.rgb(red: 69, green: 83, blue: 111)
    view.addSubview(redView)
    view.addConstraintsWithFormat(format: "H:|[v0]|", views: redView)
    view.addConstraintsWithFormat(format: "V:[v0(50)]", views: redView)
    
    view.addSubview(menuBar)
    view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
    view.addConstraintsWithFormat(format: "V:[v0(50)]", views: menuBar)
    
    menuBar.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true

  }
  
}

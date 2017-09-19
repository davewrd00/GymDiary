//
//  CollectionViewMenuBar.swift
//  GymDiary
//
//  Created by David on 18/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit

class CollectionViewMenuBar: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
  
  let cellId = "cellId"
  
  let imageNames = ["number", "weight-1", "sets"]
  
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.backgroundColor = UIColor.rgb(red: 97, green: 107, blue: 129)
    cv.dataSource = self
    cv.delegate = self
    return cv
  }()
  
  var exerciseDetailVC = ExerciseDetailViewController()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
    
    addSubview(collectionView)
    collectionView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 120)
    
    let selectedIndexPath = IndexPath(item: 0, section: 0)
    collectionView.selectItem(at: selectedIndexPath, animated: false, scrollPosition: [])
    
    setupHorizontalBar()
    
  }
  
  var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
  
  fileprivate func setupHorizontalBar() {
    let horizontalBarView = UIView()
    horizontalBarView.backgroundColor = .white
    horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
    addSubview(horizontalBarView)
    
    horizontalBarLeftAnchorConstraint = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
    horizontalBarLeftAnchorConstraint?.isActive = true
    horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3).isActive = true
    horizontalBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
    
    
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
    cell.imageView.image = UIImage(named: imageNames[indexPath.item])?.withRenderingMode(.alwaysTemplate)
    cell.tintColor = UIColor.gray
    //cell.backgroundColor = .yellow
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: frame.width / 3, height: frame.height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//    let x = CGFloat(indexPath.item) * frame.width / 3
//    horizontalBarLeftAnchorConstraint?.constant = x
//
//    UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//      self.layoutIfNeeded()
//    }, completion: nil)
    
    self.exerciseDetailVC.scrollToMenuIndex(menuIndex: indexPath.item)
  }
  
  
}

class MenuCell: UICollectionViewCell {
  
  let imageView: UIImageView = {
    let iv = UIImageView()
    return iv
  }()
  
  override var isHighlighted: Bool {
    didSet {
      imageView.tintColor = isHighlighted ? UIColor.white: UIColor.gray
    }
  }
    
  override var isSelected: Bool {
    didSet {
      imageView.tintColor = isSelected ? UIColor.white: UIColor.gray
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(imageView)
    addConstraintsWithFormat(format: "H:[v0(28)]", views: imageView)
    addConstraintsWithFormat(format: "V:[v0(28)]", views: imageView)
    addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
    addConstraint(NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1, constant: 0))
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

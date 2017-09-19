//
//  SetsCellView.swift
//  GymDiary
//
//  Created by David on 18/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit

class SetsCellView: UICollectionViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
  
  let cellId = "cellId"
  
  var numbersArr = [1, 2, 3, 4, 5, 6, 7, 8]
  
  var numbers = [Int]()
  
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.backgroundColor = UIColor.rgb(red: 69, green: 83, blue: 111)
    cv.delegate = self
    cv.dataSource = self
    return cv
  }()

  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(collectionView)
 
    addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
    addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
    
    collectionView.register(SetsNumberCell.self, forCellWithReuseIdentifier: cellId)
    setupDatasourceSets()

  }
  
  func setupDatasourceSets() {
 
    for num in numbersArr {
      print(num)
      self.numbers.append(num)
      self.collectionView.reloadData()
    }

  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return numbers.count
    
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SetsNumberCell
    cell.numbers = numbers[indexPath.item]
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: frame.width, height: 75)
  }
  
  
  
  
  
}

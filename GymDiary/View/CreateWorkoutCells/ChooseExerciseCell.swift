//
//  ChooseExerciseCell.swift
//  GymDiary
//
//  Created by David on 14/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit

class ChooseExerciseCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
  let cellId = "cellId"
  
  let collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.backgroundColor = UIColor.rgb(red: 97, green: 107, blue: 129)
    return cv
  }()
  
  let infoLabel: UILabel = {
    let lbl = UILabel()
    lbl.text = "Please add some exercises by pressing the 'Add exercise' button below"
    lbl.textColor = .white
    lbl.font = UIFont(name: "HelveticaNeue-Italic", size: 12)
    lbl.numberOfLines = 0
    lbl.textAlignment = .center
    return lbl
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = UIColor.rgb(red: 69, green: 83, blue: 111)
    
    collectionView.register(ExercisesChosenByUserCell.self, forCellWithReuseIdentifier: cellId)
    collectionView.delegate = self
    collectionView.dataSource = self
    
    addSubview(infoLabel)
    addSubview(collectionView)
    
    infoLabel.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 360, height: 0)
    infoLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    
    collectionView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 180)
    
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ExercisesChosenByUserCell
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: frame.width, height: 70)
  }
  
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}

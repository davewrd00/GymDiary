//
//  MuscleGroupCell.swift
//  GymDiary
//
//  Created by David on 14/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit

class MusclegroupCell: UICollectionViewCell {
  
  lazy var muscleGroupImage: UIImageView = {
    let iv = UIImageView()
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    iv.backgroundColor = .yellow
    return iv
  }()
  
  var muscleGroupName: UILabel = {
    let lbl = UILabel()
    lbl.text = "Chest"
    lbl.textColor = .white
    lbl.font = UIFont(name: "HelveticaNeue-Bold", size: 24)
    return lbl
  }()
  
  let cellView: UIView = {
    let v = UIView()
    v.backgroundColor = UIColor.rgb(red: 69, green: 83, blue: 111)
    v.layer.shadowColor = UIColor.black.cgColor
    v.layer.shadowOpacity = 0.5
    v.layer.shadowOffset = CGSize(width: -1, height: 1)
    v.layer.shadowRadius = 1
    v.layer.cornerRadius = 3
    return v
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(cellView)
    addSubview(muscleGroupImage)
    addSubview(muscleGroupName)
    
    cellView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 8, paddingBottom: 4, paddingRight: 8, width: 0, height: 0)
    
    muscleGroupImage.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 50, height: 50)
    muscleGroupImage.layer.cornerRadius = 50 / 2
    muscleGroupImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    
    muscleGroupName.anchor(top: muscleGroupImage.topAnchor, left: muscleGroupImage.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    muscleGroupName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

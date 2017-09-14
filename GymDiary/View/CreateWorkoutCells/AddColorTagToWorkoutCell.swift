//
//  AddColorTagToWorkoutCell.swift
//  GymDiary
//
//  Created by David on 14/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit

class AddColorTagToWorkoutCell: UICollectionViewCell {
  
  let colorLabel: UILabel = {
    let lbl = UILabel()
    lbl.text = "Color tag"
    lbl.textColor = .white
    return lbl
  }()
  
  let colorTag: UIView = {
    let v = UIView()
    v.backgroundColor = .red
    v.layer.borderWidth = 1
    v.layer.borderColor = UIColor.white.cgColor
    return v
  }()
  
  let colorTag2: UIView = {
    let v = UIView()
    v.backgroundColor = .orange
    v.layer.borderWidth = 1
    v.layer.borderColor = UIColor.white.cgColor
    return v
  }()
  
  let colorTag3: UIView = {
    let v = UIView()
    v.backgroundColor = .yellow
    v.layer.borderWidth = 1
    v.layer.borderColor = UIColor.white.cgColor
    return v
  }()
  
  let colorTag4: UIView = {
    let v = UIView()
    v.backgroundColor = .brown
    v.layer.borderWidth = 1
    v.layer.borderColor = UIColor.white.cgColor
    return v
  }()
  
  let colorTag5: UIView = {
    let v = UIView()
    v.backgroundColor = .green
    v.layer.borderWidth = 1
    v.layer.borderColor = UIColor.white.cgColor
    return v
  }()
  
  let colorTag6: UIView = {
    let v = UIView()
    v.backgroundColor = .blue
    v.layer.borderWidth = 1
    v.layer.borderColor = UIColor.white.cgColor
    return v
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = UIColor.rgb(red: 69, green: 83, blue: 111)
    
    addSubview(colorLabel)
    addSubview(colorTag)
    addSubview(colorTag2)
    addSubview(colorTag3)
    addSubview(colorTag4)
    addSubview(colorTag5)
    addSubview(colorTag6)
    
    colorLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    
    colorTag.anchor(top: colorLabel.bottomAnchor, left: colorLabel.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 30, height: 30)
    colorTag.layer.cornerRadius = 30 / 2
    colorTag.clipsToBounds = true
    colorTag.layer.masksToBounds = true
    
    colorTag2.anchor(top: colorLabel.bottomAnchor, left: colorTag.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 30, height: 30)
    colorTag2.layer.cornerRadius = 30 / 2
    colorTag2.clipsToBounds = true
    colorTag2.layer.masksToBounds = true
    
    colorTag3.anchor(top: colorLabel.bottomAnchor, left: colorTag2.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 30, height: 30)
    colorTag3.layer.cornerRadius = 30 / 2
    colorTag3.clipsToBounds = true
    colorTag3.layer.masksToBounds = true
    
    colorTag4.anchor(top: colorLabel.bottomAnchor, left: colorTag3.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 30, height: 30)
    colorTag4.layer.cornerRadius = 30 / 2
    colorTag4.clipsToBounds = true
    colorTag4.layer.masksToBounds = true
    
    colorTag5.anchor(top: colorLabel.bottomAnchor, left: colorTag4.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 30, height: 30)
    colorTag5.layer.cornerRadius = 30 / 2
    colorTag5.clipsToBounds = true
    colorTag5.layer.masksToBounds = true
    
    colorTag6.anchor(top: colorLabel.bottomAnchor, left: colorTag5.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 30, height: 30)
    colorTag6.layer.cornerRadius = 30 / 2
    colorTag6.clipsToBounds = true
    colorTag6.layer.masksToBounds = true
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

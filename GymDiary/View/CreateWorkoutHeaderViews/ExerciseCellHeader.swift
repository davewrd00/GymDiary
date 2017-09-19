//
//  ExerciseCellHeader.swift
//  GymDiary
//
//  Created by David on 14/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit

class ExerciseCellHeader: UICollectionViewCell {
  
  let separatorView: UIView = {
    let v = UIView()
    v.backgroundColor = .white
    return v
  }()
  
  let lbl: UILabel = {
    let lbl = UILabel()
    lbl.text = "   Exercises"
    lbl.textColor = .white
    return lbl
  }()
  
  let addExerciseButton: UIButton = {
    let btn = UIButton()
    let addImage = UIImage(named: "add")
    btn.setImage(addImage?.withRenderingMode(.alwaysOriginal), for: .normal)
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
    return btn
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = UIColor.rgb(red: 69, green: 83, blue: 111)
    
    addSubview(lbl)
    addSubview(addExerciseButton)
    addSubview(separatorView)
    
    lbl.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 250, height: 0)
    addExerciseButton.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 5, width: 50, height: 50)
    addExerciseButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    separatorView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

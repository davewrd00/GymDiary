//
//  AddWorkout.swift
//  GymDiary
//
//  Created by David on 14/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit

class AddWorkoutView: UICollectionViewCell {
  
  let workoutNameLabel: UITextField = {
    let lbl = UITextField()
    lbl.attributedPlaceholder = NSAttributedString(string: "   Workout name", attributes: [NSAttributedStringKey.font: UIFont(name: "HelveticaNeue-Thin", size: 16) ?? "", NSAttributedStringKey.foregroundColor: UIColor.white])
    lbl.textColor = .white
    lbl.font = UIFont(name: "Helvetica-Thin", size: 20)
    return lbl
  }()
  
  let separatorView: UIView = {
    let v = UIView()
    v.backgroundColor = .white
    return v
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(workoutNameLabel)
    addSubview(separatorView)

    backgroundColor = UIColor.rgb(red: 69, green: 83, blue: 111)
    
    workoutNameLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 250, height: 0)
    separatorView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

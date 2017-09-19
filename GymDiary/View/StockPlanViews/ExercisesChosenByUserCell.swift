//
//  ExercisesChosenByUserCell.swift
//  GymDiary
//
//  Created by David on 14/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit

class ExercisesChosenByUserCell: UICollectionViewCell {
  
  var exercise: IndividualExercise? {
    didSet {
      self.exerciseName.text = exercise?.name
    }
  }
  
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
  
  let exerciseName: UILabel = {
    let lbl = UILabel()
    //lbl.text = "Dumbbell Bench Press"
    lbl.textColor = .white
    lbl.font = UIFont(name: "HelveticaNeue-Thin", size: 16)
    return lbl
  }()

  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(cellView)
    addSubview(exerciseName)
    
    cellView.anchor(top: topAnchor, left: leftAnchor
      , bottom: bottomAnchor
      , right: rightAnchor, paddingTop: 4, paddingLeft: 4, paddingBottom: 4, paddingRight: 4, width: 0, height: 0)
    
    exerciseName.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    exerciseName.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
}

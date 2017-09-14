//
//  WorkoutDayCell.swift
//  GymDiary
//
//  Created by David on 14/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit

class WorkoutDayCell: UICollectionViewCell {
  
  lazy var workoutDay: UILabel = {
    let lbl = UILabel()
    lbl.text = "Mo"
    let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDayLabelSelected))
    lbl.addGestureRecognizer(gestureRecognizer)
    lbl.textColor = .white
    lbl.isUserInteractionEnabled = true
    return lbl
  }()
  
  lazy var workoutDay2: UILabel = {
    let lbl = UILabel()
    lbl.text = "Tu"
    let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDayLabelSelected))
    lbl.addGestureRecognizer(gestureRecognizer)
    lbl.textColor = .white
    lbl.isUserInteractionEnabled = true
    return lbl
  }()
  
  lazy var workoutDay3: UILabel = {
    let lbl = UILabel()
    lbl.text = "We"
    let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDayLabelSelected))
    lbl.addGestureRecognizer(gestureRecognizer)
    lbl.textColor = .white
    lbl.isUserInteractionEnabled = true
    return lbl
  }()
  
  lazy var workoutDay4: UILabel = {
    let lbl = UILabel()
    lbl.text = "Th"
    let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDayLabelSelected))
    lbl.addGestureRecognizer(gestureRecognizer)
    lbl.textColor = .white
    lbl.isUserInteractionEnabled = true
    return lbl
  }()
  
  lazy var workoutDay5: UILabel = {
    let lbl = UILabel()
    lbl.text = "Fr"
    let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDayLabelSelected))
    lbl.addGestureRecognizer(gestureRecognizer)
    lbl.textColor = .white
    lbl.isUserInteractionEnabled = true
    return lbl
  }()
  
  lazy var workoutDay6: UILabel = {
    let lbl = UILabel()
    lbl.text = "Sa"
    let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDayLabelSelected))
    lbl.addGestureRecognizer(gestureRecognizer)
    lbl.textColor = .white
    lbl.isUserInteractionEnabled = true
    return lbl
  }()
  
  let workoutDay7: UILabel = {
    let lbl = UILabel()
    lbl.text = "Su"
    let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDayLabelSelected))
    lbl.addGestureRecognizer(gestureRecognizer)
    lbl.textColor = .white
    lbl.isUserInteractionEnabled = true
    return lbl
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = UIColor.rgb(red: 69, green: 83, blue: 111)
    
    addSubview(workoutDay)
    addSubview(workoutDay2)
    addSubview(workoutDay3)
    addSubview(workoutDay4)
    addSubview(workoutDay5)
    addSubview(workoutDay6)
    addSubview(workoutDay7)
    
    workoutDay.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 30, height: 30)
    workoutDay.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    
    workoutDay2.anchor(top: workoutDay.topAnchor, left: workoutDay.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 30, height: 30)
     workoutDay2.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    
    workoutDay3.anchor(top: workoutDay.topAnchor, left: workoutDay2.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 30, height: 30)
    workoutDay3.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    
    workoutDay4.anchor(top: workoutDay.topAnchor, left: workoutDay3.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 30, height: 30)
    workoutDay4.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    
    workoutDay5.anchor(top: workoutDay.topAnchor, left: workoutDay4.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 30, height: 30)
    workoutDay5.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    
    workoutDay6.anchor(top: workoutDay.topAnchor, left: workoutDay5.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 30, height: 30)
    workoutDay6.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    
    workoutDay7.anchor(top: workoutDay.topAnchor, left: workoutDay6.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 15, paddingBottom: 0, paddingRight: 0, width: 30, height: 30)
    workoutDay7.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc func handleDayLabelSelected() {
    print(123)
  }
  
  
  
}

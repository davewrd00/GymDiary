//
//  WorkoutDayHeader.swift
//  GymDiary
//
//  Created by David on 14/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit

class WorkoutDay: UICollectionViewCell {
  
  let separatorView: UIView = {
    let v = UIView()
    v.backgroundColor = .white
    return v
  }()
  
  let lbl: UILabel = {
    let lbl = UILabel()
    lbl.text = "   Select workout day"
    lbl.textColor = .white
    return lbl
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = UIColor.rgb(red: 69, green: 83, blue: 111)
    
    addSubview(lbl)
    addSubview(separatorView)
    
    lbl.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 250, height: 0)
    separatorView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

//
//  ChoseAnExerciseHeader.swift
//  GymDiary
//
//  Created by David on 14/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit

class ChooseAnExerciseHeader: UICollectionViewCell {

  let nameLabel: UILabel = {
    let lbl = UILabel()
    lbl.textColor = .white
    lbl.font = UIFont(name: "HelveticaNeue-Bold", size: 24)
    lbl.textAlignment = .center
    return lbl
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = UIColor.rgb(red: 69, green: 83, blue: 111)
    
    addSubview(nameLabel)
    
    nameLabel.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 5, paddingRight: 0, width: 300, height: 0)
    nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
}



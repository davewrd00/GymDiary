//
//  ChooseExerciseHeaderCell.swift
//  GymDiary
//
//  Created by David on 14/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit

class ChooseExerciseHeaderCell: UICollectionViewCell {
  
  let descriptionLabel: UILabel = {
    let lbl = UILabel()
    lbl.text = "Choose a muscle group from below and then choose individual exercises"
    lbl.textColor = .white
    lbl.textAlignment = .center
    lbl.font = UIFont(name: "HelveticaNeue-Thin", size: 16)
    lbl.numberOfLines = 0
    return lbl
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = UIColor.rgb(red: 69, green: 83, blue: 111)
    
    addSubview(descriptionLabel)
    descriptionLabel.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: frame.width, height: 0)
    descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
}

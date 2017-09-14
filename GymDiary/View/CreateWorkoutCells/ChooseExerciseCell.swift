//
//  ChooseExerciseCell.swift
//  GymDiary
//
//  Created by David on 14/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit

class ChooseExerciseCell: UICollectionViewCell {
  
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
    
    addSubview(infoLabel)
    
    infoLabel.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 360, height: 0)
    infoLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}

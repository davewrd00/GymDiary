//
//  RepsNumberCell.swift
//  GymDiary
//
//  Created by David on 18/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit

class RepsNumberCell: UICollectionViewCell {
  
  var reps: Int? {
    didSet {
      self.repsNumberLabel.text = "\(reps ?? 1)"
    }
  }
  
  let repsNumberLabel: UILabel = {
    let lbl = UILabel()
    lbl.textColor = .white
    lbl.font = UIFont(name: "HelveticaNeue-Thin", size: 30)
    return lbl
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .red
    
    addSubview(repsNumberLabel)
    
    repsNumberLabel.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    repsNumberLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    repsNumberLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

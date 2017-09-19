//
//  SetsNumberCell.swift
//  GymDiary
//
//  Created by David on 18/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit

class SetsNumberCell: UICollectionViewCell {
  
  var numbers: Int? {
    didSet {
      var numberAsString = "\(numbers ?? 1)"
      self.setsNumberLabel.text = numberAsString
    }
  }
  
  let setsNumberLabel: UILabel = {
    let lbl = UILabel()
    lbl.textColor = .white
    //lbl.text = "1"
    lbl.font = UIFont(name: "HelveticaNeue-Thin", size: 30)
    return lbl
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .blue
    
    addSubview(setsNumberLabel)
    setsNumberLabel.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    setsNumberLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    setsNumberLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

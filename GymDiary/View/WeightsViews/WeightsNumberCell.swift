//
//  weightsNumberCell.swift
//  GymDiary
//
//  Created by David on 18/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit

class WeightsNumberCell: UICollectionViewCell {
  
  var weights: String? {
    didSet {
      self.weightsNumberLabel.text = weights
    }
  }

  
  var weightsNumberLabel: UILabel = {
    let lbl = UILabel()
    lbl.textColor = .white
    lbl.font = UIFont(name: "HelveticaNeue-Thin", size: 30)
    return lbl
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .red

    addSubview(weightsNumberLabel)
    
    weightsNumberLabel.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    weightsNumberLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    weightsNumberLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
}

//
//  StockPlanHeader.swift
//  GymDiary
//
//  Created by David on 15/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit

class StockPlanHeader: UICollectionViewCell {
  
  let descriptionLabel: UILabel = {
    let lbl = UILabel()
    lbl.textColor = .white
    lbl.font = UIFont(name: "HelveticaNeue-Italic", size: 16)
    lbl.text = "Choose a plan from below to view its details"
    lbl.textAlignment = .center
    lbl.numberOfLines = 0
    return lbl
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = UIColor.rgb(red: 69, green: 83, blue: 111)
    
    addSubview(descriptionLabel)
    descriptionLabel.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 280, height: 0)
    descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

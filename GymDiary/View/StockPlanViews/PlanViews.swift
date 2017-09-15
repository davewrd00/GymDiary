//
//  PlanViews.swift
//  GymDiary
//
//  Created by David on 15/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit

class PlanViews: UICollectionViewCell {
  
  let planNameLabel: UILabel = {
    let lbl = UILabel()
    lbl.textColor = .white
    lbl.font = UIFont(name: "HelveticaNeue-Bold", size: 24.0)
    lbl.textAlignment = .center
    lbl.text = "P/P/L"
    return lbl
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = UIColor.rgb(red: 69, green: 83, blue: 111)
    
    addSubview(planNameLabel)
    planNameLabel.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 0)
    planNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    planNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
}

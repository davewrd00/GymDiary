//
//  PreviousWorkoutView.swift
//  GymDiary
//
//  Created by David on 13/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit

class PreviousWorkoutView: UICollectionViewCell {
  
  let dateLabel: UILabel = {
    let lbl = UILabel()
    lbl.text = "CHEST AND TRICEPS"
    lbl.font = UIFont(name: "HelveticaNeue-Thin", size: 18)
    lbl.textColor = .white
    return lbl
  }()

  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .blue
    
    addSubview(dateLabel)
    dateLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 0, paddingRight: 0, width: 0, height: 50)

  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

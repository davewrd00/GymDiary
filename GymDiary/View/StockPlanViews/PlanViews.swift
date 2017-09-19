//
//  PlanViews.swift
//  GymDiary
//
//  Created by David on 15/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit

class PlanViews: UICollectionViewCell {
  
  var plans: WorkoutPlans? {
    didSet {
      planNameLabel.text = plans?.name
      guard let imageUrl = plans?.imageUrl else { return }
      self.planImageView.loadImage(urlString: imageUrl)
    }
  }
  
  let planNameLabel: UILabel = {
    let lbl = UILabel()
    lbl.textColor = .white
    lbl.font = UIFont(name: "HelveticaNeue-Bold", size: 24.0)
    lbl.textAlignment = .center
    lbl.text = "P/P/L"
    return lbl
  }()
  
  let planImageView: CustomImageView = {
    let iv = CustomImageView()
    iv.contentMode = .scaleAspectFill
    iv.clipsToBounds = true
    return iv
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = UIColor.rgb(red: 69, green: 83, blue: 111)
    
    addSubview(planImageView)
    addSubview(planNameLabel)
    
    
    planNameLabel.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 0)
    planNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    planNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    
    planImageView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
  
}

//
//  HomeHeaderCell.swift
//  GymDiary
//
//  Created by David on 13/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit

class HomeHeaderCell: UIView {
  
  let userProfileView: CustomImageView = {
    let iv = CustomImageView()
    iv.backgroundColor = .white
    return iv
  }()
  
  let userNameLabel: UILabel = {
    let lbl = UILabel()
    lbl.font = UIFont(name: "HelveticaNeue-Bold", size: 24)
    lbl.textColor = .white
    return lbl
  }()
  
  let separatorViewH: UIView = {
    let v = UIView()
    v.backgroundColor = .white
    return v
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = UIColor.rgb(red: 69, green: 83, blue: 111)
    
    addSubview(separatorViewH)
    addSubview(userProfileView)
    addSubview(userNameLabel)
    
    separatorViewH.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1)
    
    userProfileView.anchor(top: topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 50, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 80, height: 80)

    userProfileView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    userProfileView.layer.cornerRadius = 80 / 2
    userProfileView.clipsToBounds = true
    
    userNameLabel.anchor(top: userProfileView.bottomAnchor, left: nil, bottom: nil, right: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 200, height: 0)
    userNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}

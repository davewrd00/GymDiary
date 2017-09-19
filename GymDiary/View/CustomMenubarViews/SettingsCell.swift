//
//  SettingsCell.swift
//  GymDiary
//
//  Created by David on 17/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit

class SettingsCell: UICollectionViewCell {
  
  override var isHighlighted: Bool {
    didSet {
      backgroundColor = isHighlighted ? UIColor.darkGray : UIColor.white
      nameLabel.textColor = isHighlighted ? UIColor.white: UIColor.black
      iconImageView.tintColor = isHighlighted ? UIColor.white: UIColor.darkGray
    }
  }
  
  var setting: Setting? {
    didSet {
      nameLabel.text = setting?.name.rawValue
      
      if let imageName = setting?.imageName {
        iconImageView.image = UIImage(named: imageName)?.withRenderingMode(.alwaysOriginal)
        iconImageView.tintColor = .darkGray
      }
    }
  }
  
  let nameLabel: UILabel = {
    let label = UILabel()
    label.text = "Setting"
    label.font = UIFont.systemFont(ofSize: 13)
    return label
  }()
  
  let iconImageView: UIImageView = {
    let view = UIImageView()
    view.image = UIImage(named: "settings")
    view.contentMode = .scaleAspectFill
    return view
  }()
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(nameLabel)
    addSubview(iconImageView)
    
    iconImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 20, height: 20)
    iconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    
    nameLabel.anchor(top: iconImageView.topAnchor, left: iconImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
  
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}


//
//  User.swift
//  GymDiary
//
//  Created by David on 13/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import Foundation

struct User {
  
  let uid: String
  let name: String
  let profileImageUrl: String
  
  init(uid: String, dictionary: [String: Any]) {
    self.uid = uid as String
    self.name = dictionary["name"] as? String ?? ""
    self.profileImageUrl = dictionary["profileImageURL"] as? String ?? ""
    
  }
}

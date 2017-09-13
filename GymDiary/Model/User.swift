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
  
  init(uid: String, name: String, profileImageUrl: String) {
    self.uid = uid as String
    self.name = name as String
    self.profileImageUrl = profileImageUrl as String
  }
}

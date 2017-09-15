//
//  MuscleGroups.swift
//  GymDiary
//
//  Created by David on 15/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import Foundation

struct MuscleGroups {
  
  let name: String!
  
  init(dictionary: [String: Any]) {
    self.name = dictionary["name"] as? String ?? ""
  }
  
}

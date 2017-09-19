//
//  WorkoutPlans.swift
//  GymDiary
//
//  Created by David on 17/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import Foundation

struct WorkoutPlans {
  
  let name: String
  let imageUrl: String
  
  init(dictionary: [String: Any]) {
    self.name = dictionary["name"] as? String ?? ""
    self.imageUrl = dictionary["imageUrl"] as? String ?? ""
  }
  
}

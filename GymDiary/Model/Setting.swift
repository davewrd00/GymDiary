//
//  File.swift
//  GymDiary
//
//  Created by David on 17/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import Foundation

enum SettingName: String {
  
  case Cancel = "Cancel"
  case Profile = "Profile"
  case SignOut = "Sign out"
  case SendFeedback = "Send Feedback"
  case Help = "Help"
}

class Setting: NSObject {
  
  let name: SettingName
  let imageName: String
  
  init(name: SettingName, imageName: String) {
     self.name = name
    self.imageName = imageName
  }
}

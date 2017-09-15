//
//  DataService.swift
//  GymDiary
//
//  Created by David on 15/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit
import Firebase

class DataService {
  
  static let sharedInstance = DataService()
  
  func fetchUserWithUID(uid: String, completion: @escaping (User) -> ()) {
    Database.database().reference().child("users").child(uid).observeSingleEvent(of: .value, with: { (snapshot) in
      guard let userDictionary = snapshot.value as? [String: Any] else { return }
      
      let user = User(uid: uid, dictionary: userDictionary)
      print(user.name)
      
      completion(user)
      
    }) { (err) in
      print("Failed to fetch user for posts", err)
    }
  }
  
  func fetchMuscleGroupsFromDatabase(completionBlock: @escaping (MuscleGroups) -> ()) {
    let ref = Database.database().reference().child("muscleGroups")
    ref.observeSingleEvent(of: .value, with: { (snapshot) in
      guard let dictionary = snapshot.value as? [String: Any] else { return }
      dictionary.forEach({ (arg) in
        let (_, value) = arg
        guard let muscleGroup = value as? [String: Any] else { return }
        let groups = MuscleGroups(dictionary: muscleGroup)
        completionBlock(groups)
      })
    }) { (err) in
      print("Failed to fetch the muscle groups", err)
      return
    }
  }
  
  func saveImageToFirebaseStorage(uploadData: Data, imageLocation: String, completionBlock: @escaping ((String) -> Void )) {
    let fileName = NSUUID().uuidString
    Storage.storage().reference().child(imageLocation).child(fileName).putData(uploadData, metadata: nil) { (metadata, err) in
      if let err = err {
        print("Failed yo uplaod the image to firebase storage")
        return
      }
      guard let profileImageURL = metadata?.downloadURL()?.absoluteString else { return }
      completionBlock(profileImageURL)
      
      print("Successfully been able to upload image to storage in FB")
    }
  }
  
}

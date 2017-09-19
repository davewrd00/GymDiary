//
//  StockWorkoutPlansViewController.swift
//  GymDiary
//
//  Created by David on 15/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit
import Firebase

class StockWorkoutPlansViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  var workoutPlans = [WorkoutPlans]()
  
  var planCell = PlanViews()
  
  let headerId = "headerId"
  
  let cellId = "cellId"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    loadWorkoutPlans()
    
    navigationController?.navigationBar.barTintColor = UIColor.rgb(red: 69, green: 83, blue: 111)
    
    collectionView?.backgroundColor = UIColor.rgb(red: 97, green: 107, blue: 129)
    collectionView?.register(StockPlanHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
    collectionView?.register(PlanViews.self, forCellWithReuseIdentifier: cellId)
    
    
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
   return CGSize(width: view.frame.width, height: 120)
  }
  
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! StockPlanHeader
    return header
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return workoutPlans.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PlanViews
    cell.plans = workoutPlans[indexPath.item]
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 200)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }
  
  private func loadWorkoutPlans() {
    Database.database().reference().child("workoutPlans").observeSingleEvent(of: .value, with: { (snapshot) in
      guard let workoutDict = snapshot.value as? [String: Any] else { return }
      print("lala \(workoutDict)")
      workoutDict.forEach({ (arg) in
        let (_, value) = arg
        guard let dict = value as? [String: Any] else { return }
        let workouts = WorkoutPlans(dictionary: dict)
        print(dict)
        self.workoutPlans.append(workouts)
        self.collectionView?.reloadData()
      })
    }) { (err) in
      print("Error fetching this list", err)
      return
    }
  }
  
}

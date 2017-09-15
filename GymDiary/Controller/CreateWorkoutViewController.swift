//
//  CreateWorkoutViewController.swift
//  GymDiary
//
//  Created by David on 14/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit

class CreateWorkoutViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  let cellId = "cellId"
  
  let cellId2 = "cellID2"
  
  let cellId3 = "cellID3"
  
  let headerId = "headerId"
  
  let addExercise: UIButton = {
    let btn = UIButton()
    btn.backgroundColor = UIColor.rgb(red: 126, green: 211, blue: 31)
    let flagImage = UIImage(named: "weight")
    btn.setImage(flagImage?.withRenderingMode(.alwaysOriginal), for: .normal)
    btn.addTarget(self, action: #selector(handleAddExercise), for: .touchUpInside)
    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
    btn.alpha = 0.6
    return btn
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView?.backgroundColor = UIColor.rgb(red: 97, green: 107, blue: 129)
    collectionView?.register(AddColorTagToWorkoutCell.self, forCellWithReuseIdentifier: cellId)
    collectionView?.register(WorkoutDayCell.self, forCellWithReuseIdentifier: cellId2)
    collectionView?.register(ChooseExerciseCell.self, forCellWithReuseIdentifier: cellId3)
    
    collectionView?.register(WorkoutDay.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerId1")
    collectionView?.register(ExerciseCellHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerId2")
    collectionView?.register(AddWorkoutView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "cross").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleExitFromVC))
    navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "tick").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleCreateWorkout))
    
    navigationItem.title = "New workout plan"
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont(name: "HelveticaNeue", size: 20) ?? ""]
    
    view.addSubview(addExercise)
    addExercise.anchor(top: nil, left: nil, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 120, paddingRight: 8, width: 70, height: 70)
    addExercise.layer.cornerRadius = 5
  }
  
  // MARK:- UICollectionview
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    if indexPath.section == 0 {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AddColorTagToWorkoutCell
      return cell
    } else if indexPath.section == 1 {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId2, for: indexPath) as! WorkoutDayCell
      return cell
    } else if indexPath.section == 2 {
      let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId3, for: indexPath) as! ChooseExerciseCell
      return cell 
    }
    
    let defCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId2, for: indexPath)
    return defCell
    
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 1
  }
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 3
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    if indexPath.section == 0 {
         return CGSize(width: view.frame.width, height: 100)
    } else if indexPath.section == 1 {
      return CGSize(width: view.frame.width, height: 100)
    }
    return CGSize(width: view.frame.width, height: 240)
 
  }
  
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    if indexPath.section == 0 {
      let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AddWorkoutView

      return header
    } else if indexPath.section == 1 {
      let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId1", for: indexPath) as! WorkoutDay

      return header
    } else if indexPath.section == 2 {
      let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId2", for: indexPath) as! ExerciseCellHeader

      return header
    }
    let defaultHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId1", for: indexPath)
    return defaultHeader
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: view.frame.width, height: 60)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsetsMake(0, 0, 10, 0)
  }
  
  
  @objc func handleExitFromVC() {
    self.navigationController?.popViewController(animated: true)
  }
  
  @objc func handleCreateWorkout() {
    print(123)
  }
  
  @objc func handleAddExercise() {
    print(123)
    
    let layout = UICollectionViewFlowLayout()
    let exerciseVC = AddExerciseViewController(collectionViewLayout: layout)
    self.navigationController?.pushViewController(exerciseVC, animated: true)
  }
  
}

//
//  AddExerciseViewController.swift
//  GymDiary
//
//  Created by David on 14/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit
import Firebase

class AddExerciseViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  var muscleGroups = [MuscleGroups]() {
    didSet {
      for muscle in muscleGroups {
        print(muscle.name)
      }
    }
  }
  
  let headerId = "headerId"
  
  let cellId = "cellId"

  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView?.backgroundColor = UIColor.rgb(red: 97, green: 107, blue: 129)
    collectionView?.register(ChooseExerciseHeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
    collectionView?.register(MusclegroupCell.self, forCellWithReuseIdentifier: cellId)

    navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "cross").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))
    
    loadMuscleGroupsFromFirebase()

  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MusclegroupCell
    cell.muscleGroupName.text = muscleGroups[indexPath.item].name
    return cell
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return muscleGroups.count
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 100)
  }
  
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! ChooseExerciseHeaderCell
    return header
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: view.frame.width, height: 100)
  }
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    print(indexPath.item)
    
    let layout = UICollectionViewFlowLayout()
    let chooseExerciseVC = ChooseExerciseViewController(collectionViewLayout: layout)
    self.navigationController?.pushViewController(chooseExerciseVC, animated: true)
  }
  
  @objc func handleDismiss() {
    self.navigationController?.popViewController(animated: true)
  }
  
  private func loadMuscleGroupsFromFirebase() {
    DataService.sharedInstance.fetchMuscleGroupsFromDatabase { (muscles) in
      self.muscleGroups.append(muscles)
      self.muscleGroups.sort(by: { (m1, m2) -> Bool in
        return m1.name.compare(m2.name) == .orderedAscending
      })
       self.collectionView?.reloadData()
    }
  }
  
}

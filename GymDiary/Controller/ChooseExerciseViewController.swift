//
//  ChooseExerciseViewController.swift
//  GymDiary
//
//  Created by David on 14/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit

class ChooseExerciseViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  let headerId = "headerId"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView?.backgroundColor = .yellow
    collectionView?.register(ChooseAnExerciseHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "cross").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: view.frame.width, height: 120)
  }
  
  override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! ChooseAnExerciseHeader
    return header
  }
  
  @objc func handleDismiss() {
    self.navigationController?.popViewController(animated: true)
  }
  
}

//
//  AddExerciseViewController.swift
//  GymDiary
//
//  Created by David on 14/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit

class AddExerciseViewController: UICollectionViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView?.backgroundColor = .yellow
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "cross").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))
  }
  
  @objc func handleDismiss() {
    self.navigationController?.popViewController(animated: true)
  }
  
}

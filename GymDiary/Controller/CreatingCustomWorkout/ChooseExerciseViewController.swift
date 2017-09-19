//
//  ChooseExerciseViewController.swift
//  GymDiary
//
//  Created by David on 14/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit
import Firebase

class ChooseExerciseViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UISearchBarDelegate {
  
  var exercises: MuscleGroups? {
    didSet {
      print(exercises?.name)
      self.menuBarView.nameLabel.text = exercises?.name
    }
  }
  
  var orderedExercises = [IndividualExercise]()
  
  var individualExercises = [IndividualExercise]()
  
  let headerId = "headerId"
  
  let cellId = "cellId"
  
  let menuBarView: MenuBarView = {
    let mb = MenuBarView()
    mb.backgroundColor = UIColor.rgb(red: 69, green: 83, blue: 111)
    return mb
  }()

  lazy var searchBar: UISearchBar = {
    let sb = UISearchBar()
    sb.placeholder = "Search exercises"
    sb.textColor = UIColor.gray
    sb.barTintColor = UIColor.rgb(red: 69, green: 83, blue: 111)
    UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).backgroundColor = UIColor.rgb(red: 69, green: 83, blue: 111)
    sb.delegate = self
    return sb
  }()
  
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.delegate = self
    cv.dataSource = self
    return cv
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.addSubview(menuBarView)
    view.addSubview(searchBar)
    view.addSubview(collectionView)
    
    self.edgesForExtendedLayout = []
    
    menuBarView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 80)
    
    
    searchBar.anchor(top: menuBarView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 60)
    
    collectionView.anchor(top: searchBar.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    
    
    loadIndividualExercises()
    
    
    
    collectionView.backgroundColor = UIColor.rgb(red: 97, green: 107, blue: 129)
    collectionView.register(ExercisesChosenByUserCell.self, forCellWithReuseIdentifier: cellId)
    let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
    layout?.sectionHeadersPinToVisibleBounds = true
    
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "cross").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleDismiss))

  }
  
 func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! ExercisesChosenByUserCell
    cell.exercise = orderedExercises[indexPath.item]
    return cell
  }
  
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return orderedExercises.count
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 100)
  }
  
  @objc func handleDismiss() {
    self.navigationController?.popViewController(animated: true)
  }
  
  fileprivate func loadIndividualExercises() {
    guard let muscleName = self.exercises?.name else { return }
    Database.database().reference().child("individualExercises").child(muscleName).observeSingleEvent(of: .value, with: { (snapshot) in
      guard let exerciseDict = snapshot.value as? [String: Any] else { return }
      
      exerciseDict.forEach({ (arg) in
        let (_, value) = arg
        print("POPO \(value)")
        guard let dict = value as? [String: Any] else { return }
        let exercises = IndividualExercise(dictionary: dict)
        self.individualExercises.append(exercises)
        })
      
        self.individualExercises.sort(by: { (e1, e2) -> Bool in
          return e1.name.compare(e2.name) == .orderedAscending
      })
        
        self.orderedExercises = self.individualExercises
        self.collectionView.reloadData()
      
      
    }) { (err) in
      print("Error fetching exercises", err)
      return
    }
  }
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    if searchText.isEmpty {
      orderedExercises = individualExercises
    } else {
      orderedExercises = self.individualExercises.filter { (individualExercises) -> Bool in
        return individualExercises.name.lowercased().contains(searchText.lowercased())
      }
    }
    self.collectionView.reloadData()
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    searchBar.resignFirstResponder()
    
    let exerciseChosen = orderedExercises[indexPath.item]
    print(exerciseChosen.name)
    
    let layout = UICollectionViewFlowLayout()
    let exerciseDetailVC = ExerciseDetailViewController(collectionViewLayout: layout)
    exerciseDetailVC.exerciseChosen = exerciseChosen.name
    navigationController?.pushViewController(exerciseDetailVC, animated: true)
  }
  
  
  
}

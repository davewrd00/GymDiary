//
//  TabBarController.swift
//  GymDiary
//
//  Created by David on 15/09/2017.
//  Copyright © 2017 David Ward. All rights reserved.
//

import UIKit
import Firebase

class TabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupControllers()
  }
  
  fileprivate func setupControllers() {
    
    // Home VC
    let homeVC = HomeViewController()
    let homeNavController = UINavigationController(rootViewController: homeVC)
    homeNavController.tabBarItem.image = #imageLiteral(resourceName: "home")
    
    // Plans VC
    let plansLayout = UICollectionViewFlowLayout()
    let plansVC = StockWorkoutPlansViewController(collectionViewLayout: plansLayout)
    let plansNavController = UINavigationController(rootViewController: plansVC)
    plansNavController.tabBarItem.image = #imageLiteral(resourceName: "plans")
    
    tabBar.tintColor = .white
    tabBar.barTintColor = .purple
    
    viewControllers = [homeNavController, plansNavController]
    
    guard let items = self.tabBar.items else { return }
    
    for item in items {
      item.imageInsets = UIEdgeInsetsMake(4, 0, -4, 0)
      item.title = ""
    }
    
  }
  
  
}

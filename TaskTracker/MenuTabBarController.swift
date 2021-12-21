//
//  MenuTabBarController.swift
//  TaskTracker
//
//  Created by user on 21.12.2021.
//

import Foundation
import UIKit

final class MenuTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
       tabBar.barStyle = .black
        tabBar.unselectedItemTintColor = .white
    }
}

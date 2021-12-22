//
//  ProfileScreenViewController.swift
//  TaskTracker
//
//  Created by user on 21.12.2021.
//

import Foundation
import UIKit

final class ProfileScreenViewController: UIViewController {
    
    let main = MainScreenViewController()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
      
        view.backgroundColor = .white
        setupTabBar()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationItem.title = "Calendar"
    }
    
    private func setupTabBar() {
        let home = UIImage(named: "home")
        let image = main.resizeImage(image: home!, targetSize: CGSize(width: 25, height: 25))
        
        let tabBarItem = UITabBarItem(title: "Calendar", image: image, tag: 1)
        self.tabBarItem = tabBarItem
    }
}

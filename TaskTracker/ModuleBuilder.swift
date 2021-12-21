//
//  ModuleBuilder.swift
//  TaskTracker
//
//  Created by user on 21.12.2021.
//

import Foundation
import UIKit

protocol Build {
    func createSplash() -> UIViewController
    func createTabBarViewController() -> UIViewController
    func createMainViewController() -> UIViewController
    func createProfileViewController() -> UIViewController
}

final class ModuleBuilder: Build {
    
    func createSplash() -> UIViewController {
        let splash = SplashScreenViewController()
//        let view = UINavigationController(rootViewController: splash)
        return splash
    }
    
    func createTabBarViewController() -> UIViewController {
        let tabBarView = MenuTabBarController()
      
        let mainView = createMainViewController()
        let profileView = createProfileViewController()
        
        tabBarView.modalTransitionStyle = .flipHorizontal
        tabBarView.modalPresentationStyle = .fullScreen
        tabBarView.setViewControllers([mainView,profileView], animated: false)
        
        return tabBarView
    }
    
    func createMainViewController() -> UIViewController {
        let mainView = MainScreenViewController()
        let navigation = UINavigationController(rootViewController: mainView)
        return navigation
    }
    
    func createProfileViewController() -> UIViewController {
        let profileView = ProfileScreenViewController()
        let navigation = UINavigationController(rootViewController: profileView)
        return navigation
    }
}

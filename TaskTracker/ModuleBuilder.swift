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
        let view = UINavigationController(rootViewController: splash)
        return view
    }
    
    func createTabBarViewController() -> UIViewController {
        let tabBarView = MenuTabBarController()
        tabBarView.navigationItem.hidesBackButton = true
        let mainView = createMainViewController()
        let profileView = createProfileViewController()
        
        tabBarView.setViewControllers([mainView,profileView], animated: true)
        return tabBarView
    }
    
    func createMainViewController() -> UIViewController {
        let mainView = MainScreenViewController()
        let navigaton = UINavigationController(rootViewController: mainView)
        return navigaton
    }
    
    func createProfileViewController() -> UIViewController {
        let profileView = ProfileScreenViewController()
        let navigaton = UINavigationController(rootViewController: profileView)
        return navigaton
    }
}

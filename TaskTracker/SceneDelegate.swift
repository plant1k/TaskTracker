//
//  SceneDelegate.swift
//  TaskTracker
//
//  Created by user on 08.12.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
       
        self.window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        let moduleBuilder = ModuleBuilder()
        let splashViewController = moduleBuilder.createSplash()
        
        window?.rootViewController = splashViewController
        window?.makeKeyAndVisible()
    }
}


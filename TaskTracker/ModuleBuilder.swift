//
//  ModuleBuilder.swift
//  TaskTracker
//
//  Created by user on 21.12.2021.
//

import Foundation
import UIKit

protocol Build {
    static func createSplash() -> UIViewController
}

final class ModuleBuilder: Build {
    static func createSplash() -> UIViewController {
        let view = SplashScreenViewController()
        return view
    }
}

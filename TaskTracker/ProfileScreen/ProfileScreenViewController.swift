//
//  ProfileScreenViewController.swift
//  TaskTracker
//
//  Created by user on 21.12.2021.
//

import Foundation
import UIKit

final class ProfileScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        self.title = "Profile"
        view.backgroundColor = .white
        navigationItem.title = "Profile"
        self.navigationController?.navigationBar.barTintColor = .black
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}

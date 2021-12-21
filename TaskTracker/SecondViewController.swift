//
//  SecondViewController.swift
//  TaskTracker
//
//  Created by user on 08.12.2021.
//

import UIKit

class SecondViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .purple
        navigationController?.navigationBar.prefersLargeTitles = true
        self.title = "Task"
    }
}

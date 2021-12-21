//
//  SplashScreenViewController.swift
//  TaskTracker
//
//  Created by user on 21.12.2021.
//

import Foundation
import UIKit

final class SplashScreenViewController: UIViewController {
    let label = UILabel()
    let button = UIButton()
    let imageView = UIImageView()
    let moduleBuilder = ModuleBuilder()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupButton()
        setupLabel()
        setupNavigationBar()
    }
    
    private func setup() {
        [imageView, button].forEach {
            self.view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.systemUltraThinMaterialDark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = imageView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        imageView.addSubview(blurEffectView)
        
        imageView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            button.heightAnchor.constraint(equalToConstant: 50),
            
            label.centerYAnchor.constraint(equalTo: imageView.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: imageView.centerXAnchor)
        ])
        
        self.view.backgroundColor = .black
        imageView.image = UIImage(named: "smoke")
   }
    
    private func setupNavigationBar() {
        navigationItem.hidesBackButton = true
        
    }
    
    private func setupLabel() {
        label.font = label.font.withSize(30)
        label.text = "Life Tracker"
        label.textColor = .white
    }
    
    private func setupButton() {
        button.backgroundColor = Color.seaBlue
        button.tintColor = .white
        button.setTitle("Get Started", for: .normal)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
    }
    
    @objc private func buttonTap() {
        let tabBarViewController = moduleBuilder.createTabBarViewController()
        present(tabBarViewController, animated: true, completion: nil)
    }
}

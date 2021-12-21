//
//  MainScreenViewController.swift
//  TaskTracker
//
//  Created by user on 21.12.2021.
//

import Foundation
import UIKit

final class MainScreenViewController: UIViewController {
    
    let button = UIButton()
    var table = UITableView()
    let identifier = "Cell"
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        setupNavigationBar()
        setupTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createTableView()
    }
    
    private func addButonView() -> UIView {
        let subViewForButton = UIView()
        subViewForButton.backgroundColor = UIColor(red: 28/255, green: 28/255, blue: 28/255, alpha: 1)
        subViewForButton.layer.borderColor = CGColor.init(red: 1, green: 1, blue: 1, alpha: 1)
        subViewForButton.layer.borderWidth = 0.1
        
        [subViewForButton, button].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.clipsToBounds = true
        }
        
        button.backgroundColor = Color.lightBlue
        button.setTitle("+", for: .normal)
        
        subViewForButton.addSubview(button)
        
        NSLayoutConstraint.activate([
            subViewForButton.widthAnchor.constraint(equalToConstant: 50),
            subViewForButton.heightAnchor.constraint(equalToConstant: 50),
            
            button.widthAnchor.constraint(equalToConstant: 40),
            button.heightAnchor.constraint(equalToConstant: 40),
            
            button.centerXAnchor.constraint(equalTo: subViewForButton.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: subViewForButton.centerYAnchor)
        ])
        
        subViewForButton.layer.cornerRadius = 25
        button.layer.cornerRadius = 20
        
        return subViewForButton
    }
    
    private func createTableView() {
        let buttonView = addButonView()
        
        [table, buttonView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        view.backgroundColor = .black
        table.backgroundColor = .black
        table.delegate = self
        table.dataSource = self
        table.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            buttonView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupNavigationBar() {
        navigationItem.title = "Main"
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        let doneItem = UIBarButtonItem(barButtonSystemItem: .play, target: self, action: #selector(tap))
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = doneItem
    }
    
    private func setupTabBar() {
        let home = UIImage(named: "home")
        let image = resizeImage(image: home!, targetSize: CGSize(width: 25, height: 25))
        
        let tabBarItem = UITabBarItem(title: nil, image: image, tag: 0)
        self.tabBarItem = tabBarItem
    }
    
    @objc func tap() {
        print("tik")
    }
    
    private func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(origin: .zero, size: newSize)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}

extension MainScreenViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension MainScreenViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.backgroundColor = .black
        cell.textLabel?.textColor = .white
        cell.textLabel?.text = "Tyt"
        return cell
    }
}

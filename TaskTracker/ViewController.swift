//
//  ViewController.swift
//  TaskTracker
//
//  Created by user on 08.12.2021.
//

import UIKit

final class ViewController: UIViewController {
    
    var array = [String]()
    let cellIndeficator = "Cell"
    let table = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        self.table.delegate = self
        self.table.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        sutupNavigationBar()
    }
    
    private func sutupNavigationBar() {
        // Цвет заливки вью контроллера
        view.backgroundColor = .white
        
        navigationController?.navigationBar.topItem?.title = "Task"
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        
        
        // Цвет текста для кнопки
        navigationController?.navigationBar.tintColor = .black
        
        // Добавляем кнопку "Добавить" в навигейшин бар
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Добавить",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(addItem)) // Вызов метода для кнопки
        // Присваиваем ячейку для TableView с иднетифиактором "Cell"
        table.register(UITableViewCell.self, forCellReuseIdentifier: cellIndeficator)
    }
    
    @objc func addItem(_ sender: AnyObject) {
        
        pushSecondVc()
    }
    
    private func pushSecondVc() {
        let second = SecondViewController()
        self.navigationController?.pushViewController(second, animated: true)
    }
    
    private func addAlertForNewItem() {
        
        // Создание алёрт контроллера
        let alert = UIAlertController(title: "Новая задача", message: "Пожалуйста заполните поле", preferredStyle: .alert)
        
        // Создание текстового поля
        var alertTextField: UITextField!
        alert.addTextField { textField in
            alertTextField = textField
            textField.placeholder = "Новая задача"
        }
        
        // Создание кнопки для сохранения новых значений
        let saveAction = UIAlertAction(title: "Сохранить", style: .default) { action in
            
            // Проверяем не является ли текстовое поле пустым
            guard alertTextField.text?.isEmpty == false else {
                print("The text field is empty") // Выводим сообщение на консоль, если поле не заполнено
                return
            }
            
            // Добавляем в массив новую задачу из текстового поля
            self.array.append((alert.textFields?.first?.text)!)
            
            // Обновляем таблицу
            self.table.reloadData()
        }
        
        // Создаем кнопку для отмены ввода новой задачи
        let cancelAction = UIAlertAction(title: "Отмена", style: .destructive, handler: nil)
        
        alert.addAction(saveAction) // Присваиваем алёрту кнопку для сохранения результата
        alert.addAction(cancelAction) // Присваиваем алерут кнопку для отмены ввода новой задачи
        
        present(alert, animated: true, completion: nil) // Вызываем алёрт контроллер
    }
    
    private func setup() {
        self.view.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
}

extension ViewController: UITableViewDelegate {
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

extension ViewController: UITableViewDataSource {
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndeficator, for: indexPath)
        cell.textLabel?.text = self.array[indexPath.row] + "Task"
        return cell
    }
}

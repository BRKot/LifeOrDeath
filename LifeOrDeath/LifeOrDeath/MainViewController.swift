//
//  ViewController.swift
//  LifeOrDeath
//
//  Created by Databriz on 06/08/2024.
//

import UIKit

// Нужно добавить градиент фону
// Сделать шрифт Roboto кнопке и хедеру
// Добавить CornerRadius кнопке
//
protocol MainView{
    func refrashTable()
}


class MainViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var presenter = MainPresenter()

    @IBAction func tapOnCreate(_ sender: Any) {
        presenter.addItemToList()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "RoundCell", bundle: nil), forCellReuseIdentifier: "RoundCell")
        presenter.view = self
    }


}

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.countCell()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoundCell", for: indexPath) as! RoundCell
        presenter.configure(cell: cell, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80 // Высота ячейки
    }

}

extension MainViewController: MainView{
    func refrashTable() {
        tableView.reloadData()
        DispatchQueue.main.async {
               // Убедитесь, что таблица содержит хотя бы одну секцию и строку
            guard self.tableView.numberOfSections > 0,
                  self.tableView.numberOfRows(inSection: self.tableView.numberOfSections - 1) > 0 else {
                   return
               }
               
               // Получите индекс пути последней строки
            let lastIndexPath = IndexPath(row: self.tableView.numberOfRows(inSection: self.tableView.numberOfSections - 1) - 1, section: self.tableView.numberOfSections - 1)
               
               // Прокрутите таблицу до последней строки
            self.tableView.scrollToRow(at: lastIndexPath, at: .bottom, animated: true)
           }
    }
}


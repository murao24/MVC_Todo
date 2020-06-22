
//  ViewController.swift
//  MVC_Todo
//
//  Created by 村尾慶伸 on 2020/06/21.
//  Copyright © 2020 村尾慶伸. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tableView: UITableView?
    
    var addButton: UIBarButtonItem!
    
    @objc func myAction() {
        print("ok")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupNavBar()
    }
    
    private func setupNavBar() {
        self.title = "Todo"
        addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(myAction))
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    private func setupLayout() {
        self.tableView = {
            let tableView = UITableView(frame: self.view.bounds, style: .plain)
            tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            tableView.dataSource = self
            tableView.delegate = self
            self.view.addSubview(tableView)
            return tableView
        }()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 11
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }


}


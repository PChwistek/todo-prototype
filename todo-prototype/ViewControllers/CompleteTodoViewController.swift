//
//  CompleteTodoViewController.swift
//  todo-prototype
//
//  Created by Phil on 10/14/19.
//  Copyright © 2019 Phil. All rights reserved.
//

import UIKit

class CompleteTodoViewController: UIViewController {

    var previousViewController = ItemTableUIController()
    var selectedToDo = ToDoItem(title: "default")
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = selectedToDo.title
        // Do any additional setup after loading the view.
    }
    

    @IBAction func completedTapped(_ sender: Any) {
        previousViewController.removeToDo(title: selectedToDo.title)
        previousViewController.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }
    
}

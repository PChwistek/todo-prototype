//
//  TodoTableViewController.swift
//  todo-prototype
//
//  Created by Phil on 10/13/19.
//  Copyright © 2019 Phil. All rights reserved.
//

import UIKit

class ItemTableUIController: UITableViewController {
    
    var toDos : [ToDoItem] = []
    let viewModel = ItemTableViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        toDos = viewModel.createToDos()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let toDo = toDos[indexPath.row]
        
        if toDo.important ?? false {
            cell.textLabel?.text = "🔥 " + toDo.title
        } else {
            cell.textLabel?.text = toDo.title
        }
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addVC = segue.destination as! AddTodoViewController
        addVC.previousViewController = self
        addVC.viewModel = viewModel
    }
    
    func addToDo(title: String, isImportant: Bool) {
       toDos = viewModel.addToDo(title: title, isImportant: isImportant)
    }
}

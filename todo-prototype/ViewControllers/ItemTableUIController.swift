//
//  TodoTableViewController.swift
//  todo-prototype
//
//  Created by Phil on 10/13/19.
//  Copyright © 2019 Phil. All rights reserved.
//

import UIKit

class ItemTableUIController: UITableViewController {
    
    let viewModel = ItemTableViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.toDos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let toDo = viewModel.toDos[indexPath.row]
        
        if toDo.important ?? false {
            cell.textLabel?.text = "🔥 " + toDo.title
        } else {
            cell.textLabel?.text = toDo.title
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = viewModel.toDos[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddTodoViewController {
            addVC.previousViewController = self
        }
        
        if let completeVC = segue.destination as? CompleteTodoViewController {
            if let toDo = sender as? ToDoItem {
                completeVC.previousViewController = self
                completeVC.selectedToDo = toDo
            }
        }
    }
    
    func addToDo(title: String, isImportant: Bool) {
       viewModel.addToDo(title: title, isImportant: isImportant)
    }
    
    func removeToDo(title: String) {
        viewModel.removeToDo(title: title)
    }
    
}

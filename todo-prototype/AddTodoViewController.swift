//
//  AddTodoViewController.swift
//  todo-prototype
//
//  Created by Phil on 10/13/19.
//  Copyright © 2019 Phil. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!

    var previousViewController = ItemTableUIController()
    var viewModel = ItemTableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        previousViewController.addToDo(title: titleTextField.text!, isImportant: importantSwitch.isOn)
        previousViewController.tableView.reloadData()
        navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

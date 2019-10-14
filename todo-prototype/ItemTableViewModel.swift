//
//  ItemTableViewModel.swift
//  todo-prototype
//
//  Created by Phil on 10/13/19.
//  Copyright © 2019 Phil. All rights reserved.
//

import Foundation
class ItemTableViewModel {
    
    var toDos : [ToDoItem] = []

    func createToDos() -> [ToDoItem] {
        var eggs = ToDoItem(title: "buy eggs")
        eggs.important = true
        let dog = ToDoItem(title: "walk the dog")
        
        toDos = [eggs, dog]
        return toDos
    }
    
    func addToDo(title: String, isImportant: Bool) -> [ToDoItem] {
        var toDo = ToDoItem(title: title)
        toDo.important = isImportant
        toDos.append(toDo)
        return toDos
    }
    
    
    
}

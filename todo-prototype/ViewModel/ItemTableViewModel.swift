//
//  ItemTableViewModel.swift
//  todo-prototype
//
//  Created by Phil on 10/13/19.
//  Copyright © 2019 Phil. All rights reserved.
//

import Foundation
class ItemTableViewModel {
    private let defaults = UserDefaults.standard
    var toDos =  [ToDoItem]()

    func getToDos() -> [ToDoItem] {
        return toDos
    }
    
    func createToDos() -> [ToDoItem] {
        var eggs = ToDoItem(title: "buy eggs")
        eggs.important = true
        let dog = ToDoItem(title: "walk the dog")
        
        toDos = [eggs, dog]
        return toDos
    }
    
    func addToDo(title: String, isImportant: Bool) -> [ToDoItem] {
        print(toDos.count)
        var toDo = ToDoItem(title: title)
        toDo.important = isImportant
        toDos.append(toDo)
        return toDos
    }
    
    func removeToDo(title: String) -> [ToDoItem] {
        print(toDos.count)
        for (index, item) in toDos.enumerated() {
              if item.title == title {
                  toDos.remove(at: index)
                  break
              }
          }
        return toDos
    }
    
    func fetchData() {
        
        if let list = defaults.value(forKey: "encodedList") as? [[String: Any]] {
            
            for item in list {
                guard let todoItem = ToDoItem(item) else { return }
                toDos.append(todoItem)
            }
        }
    }
    
    
    //MARK: Save data to user defaults
    
    func saveData() {
        
        var encodedList = [[String: Any]]()
        
        for item in toDos {
            guard let unwrappedItem = item.toPlist() else { return }

            encodedList.append(unwrappedItem)
        }
        defaults.set(encodedList, forKey: "encodedList")
    }
    
}

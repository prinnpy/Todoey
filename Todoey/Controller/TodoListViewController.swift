//
//  ViewController.swift
//  Todoey
//
//  Created by Prinn Prinyanut on 5/12/18.
//  Copyright © 2018 Prinn Prinyanut. All rights reserved.
//

import UIKit

class TodoListViewController : UITableViewController {
    
    //when app load
    
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem1 = Item()
        newItem1.title = "Find Mike"
        itemArray.append(newItem1)
        
        let newItem2 = Item()
        newItem2.title = "Get Milk"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Run 3 miles"
        itemArray.append(newItem3)
        
        //shows up
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
            itemArray = items
        }
        
    }
    
    //MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //MARK - Talbeview delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
    //MARK - Add new items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        //create alert
        let alert = UIAlertController(title: "Add New Todo Item", message: "", preferredStyle: .alert)
        
        //create action button
        let action = UIAlertAction(title: "Add Item", style: .default) {
            (action) in
            
            let newItem = Item()
            
            newItem.title = textField.text!
            
            self.itemArray.append(newItem) //add new item to array
            
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.tableView.reloadData() //reload the entire tableview
            
        }
        
        //add textfield to alert
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        
        //add action to alert
        alert.addAction(action)
        
        //show alert on screen
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
}

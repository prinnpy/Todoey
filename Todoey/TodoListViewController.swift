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
    
    var itemArray = ["Buy Milk","Walk Dog","Study for Finals"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    //MARK - Talbeview delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(itemArray[indexPath.row])
        
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
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
            
            self.itemArray.append(textField.text!) //add new item to array
            
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

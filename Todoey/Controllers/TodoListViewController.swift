//
//  ViewController.swift
//  Todoey
//
//  Created by jostein on 27/4/2018.
//  Copyright © 2018 jostein. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
  //  let defaults = UserDefaults.standard
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        let newItem = Item()
//        newItem.title = "Find Mike"
//        itemArray.append(newItem)
//        
//        let newItem1 = Item()
//        newItem1.title = "Buy Eggos"
//        itemArray.append(newItem1)
//        
//        let newItem2 = Item()
//        newItem2.title = "Demo"
//        itemArray.append(newItem2)
        
        
        loadItems()
//        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
//            itemArray = items
//        }
//
        
//  For userdefaults Custom object
//       if let itemsObject = defaults.object(forKey: "TodoListArray") as? Data {
//
//            itemArray = NSKeyedUnarchiver.unarchiveObject(with: itemsObject) as! [Item]
//
//       }

    }

    //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        
        
        return cell
        
    }
    
    //MARK - Tableview Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        //self.defaults.set(self.itemArray, forKey: "TodoListArray")
        
        saveItems()
        //For userdefaults Custom object
//        defaults.set(NSKeyedArchiver.archivedData(withRootObject: self.itemArray), forKey: "TodoListArray")
//        defaults.synchronize()
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }
    
    //MARK - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: nil, preferredStyle: .alert)
        var textFiled = UITextField()
        
        
        
        let alertAction = UIAlertAction(title: "Add Item", style: .default) { (action) in
            let newItem = Item()
            newItem.title = textFiled.text!
            self.itemArray.append(newItem)
            
            //For userdefaults Custom object
//            self.defaults.set(NSKeyedArchiver.archivedData(withRootObject: self.itemArray), forKey: "TodoListArray")
//            self.defaults.synchronize()
//self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.saveItems()
            
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textFiled = alertTextField
           
        }
        alert.addAction(alertAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    //MARK - Model Manupilation Methods
    func saveItems() {
        let encoder  = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(self.itemArray)
            try data.write(to: self.dataFilePath!)
        } catch {
            print("Error encoding item array, \(error)")
        }
        tableView.reloadData()
        
    }
    
    func loadItems() {
       if let data  = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
        do {
        itemArray = try decoder.decode([Item].self, from: data)
        } catch {
            print("Error decoding item array, \(error)")
        }
    }
    }


}


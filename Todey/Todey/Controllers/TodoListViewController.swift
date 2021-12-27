//
//  ViewController.swift
//  Todey
//
//  Created by sky on 12/25/21.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController {
    
//    var itemArray = [Item]()
    var itemArray: [String] = []
    
    // create userDefault
//    let defaults = UserDefaults.standard
    
    // create a data file to store data persist there
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.tableFooterView = UIView()
        
        // print path of our plist file we have just created
        print(dataFilePath)
        
        // we assign userDefault to the array, but now we don't use userDefault anymore
//        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
//            itemArray = items
//        }
        
//       loadItems()
        
    }
    
    //MARK - Modal manipulation Methods
    
//    func saveItems() {
//        // refactor with our own plist file
//        // we create an encoder object to encode our data model
//        let encoder = PropertyListEncoder()
//
//        do {
//            // we encode data itemArray
//            let data = try encoder.encode(itemArray)
//            // we write our data itemArray to plist file
//            try data.write(to:dataFilePath!)
//        } catch {
//            print("Error encoding item array, \(error)")
//        }
//
//        tableView.reloadData()
//    }
//
//    func loadItems() {
//        if let data = try? Data(contentsOf: dataFilePath!) {
//            let decoder = PropertyListDecoder()
//            do {
//                itemArray = try decoder.decode([Item].self, from: data)
//            } catch {
//                print("Error decoding item array, \(error)")
//            }
//        }
//    }

    //MARK - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoListCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
//        cell.accessoryType = item.done == true ? .checkmark : .none
//
//        cell.textLabel?.text = itemArray[indexPath.row].title
        return cell
    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let item = itemArray[indexPath.row]
        
//        item.done = !item.done
        
        // when we check the item, we toggle accessary for that cell, but only for the itemArray, not in plist file, so we call this func to rewrite the data type into plist file too
//        saveItems()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { [weak self] (action) in
            
            // we only use this for UserDefault or Codeable
//            let newItem = Item()
            
            // now we refactor create an object for our Item entity
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let newItem = Item(context: context)
            
//            newItem.title = textField.text!
            
//            self?.itemArray.append(newItem)
            
            // we set key and value to save data in userDefaults
//            self?.defaults.set(self?.itemArray, forKey: "TodoListArray")
            
            
            // refactor with using our own plist
//            self?.saveItems()
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}


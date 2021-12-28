//
//  CategoryViewController.swift
//  Todey
//
//  Created by sky on 12/27/21.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categories = [Category]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addButtonTapped(_ sender: UITabBarItem) {
        let alert = UIAlertController(title: "Add Category", message: "Type category you want", preferredStyle: .alert)
        alert.addTextField()
        let doneButton = UIAlertAction(title: "Done", style: .default) { [weak self] action in
            if let textFields = alert.textFields, let text = textFields[0].text {
                let category = Category(context: (self?.context)!)
                
                
            }
        }
    }
    
    // MARK: - Data Manipulation Methods
    
    // save func to save data
    private func saveData() {
        
    }
    
    // load func to load data
    private func loadData() {
        
    }
    
    // MARK: - UITableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        return cell
    }
    
    // MARK: - UITableView Delegate Methods
    
    
}

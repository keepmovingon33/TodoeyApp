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
        
        tableView.tableFooterView = UIView()
        navigationController?.navigationBar.tintColor = .white
        navigationItem.backButtonTitle = ""
        loadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    @IBAction func addButtonTapped(_ sender: UITabBarItem) {
        let alert = UIAlertController(title: "Add Category", message: "Type category you want", preferredStyle: .alert)
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Enter category"
        }
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            if let textFields = alert.textFields, let text = textFields[0].text {
                let newCategory = Category(context: (self?.context)!)
                newCategory.name = text
//                newCategory.items = []
                self?.categories.append(newCategory)
                self?.saveData()
            }
        }
        alert.addAction(addAction)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Data Manipulation Methods
    
    // save func to save data
    private func saveData() {
        do {
            try context.save()
        } catch {
            print("Error: \(error.localizedDescription) ")
        }
        tableView.reloadData()
    }
    
    // load func to load data
    private func loadData() {
        let request = Category.fetchRequest() as NSFetchRequest
        do {
            categories = try context.fetch(request)
        } catch {
            print("error: \(error.localizedDescription)")
        }
        
        tableView.reloadData()
    }
    
    // MARK: - UITableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        let category = categories[indexPath.row]
        cell.textLabel?.text = category.name
        return cell
    }
    
    // MARK: - UITableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "GoToDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categories[indexPath.row]
        }
    }
}

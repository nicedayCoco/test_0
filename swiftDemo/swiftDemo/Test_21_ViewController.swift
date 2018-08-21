//
//  Test_21_ViewController.swift
//  swiftDemo
//
//  Created by han xu on 2018/2/8.
//  Copyright © 2018年 han xu. All rights reserved.
//

import UIKit
import CoreData

class Test_21_ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    
    let table = UITableView()
    var dataSource = Array<TodoList>()
    let EntityName = "TodoList"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "todo list"

        let rightBarItem = UIBarButtonItem(title: "+", style: .done, target: self, action: #selector(addTodoList))
        
        self.navigationItem.rightBarButtonItem = rightBarItem;
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        table.frame = self.view.frame
        self.view.addSubview(table)
        table.delegate = self;
        table.dataSource = self;
    }
    
    
    func addTodoList(){
        let alertController = UIAlertController(title: "add new todo item", message: "", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "confirm", style: UIAlertActionStyle.default) { (_) in
            
            if let field = alertController.textFields![0] as?
                UITextField{
                self.saveContent(content: field.text!)
                self.updateDataSource()
                self.table.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addTextField { (textField) in
            textField.placeholder = "Please input the todo Item"
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true) {
            
        }
    }
    
    
    func saveContent(content:String){
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: EntityName, in: context)
        
        let todoList = NSManagedObject(entity: entity!, insertInto: context)
        
        todoList.setValue(content, forKey: "content")
        
        do{
            try context.save()
        }catch{
            print(error)
        }
        
    }
    
    func getContext()-> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as!AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    func updateDataSource(){
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName:EntityName)
        do {
            let searchResults = try getContext().fetch(fetchRequest)
            dataSource = searchResults as! [TodoList]
            
        }catch{
            
        }
        
        
        
    }
    
    
    
    
    //   MARK: - tableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "coreDataReuseId")
        cell.textLabel?.text = (dataSource[indexPath.row]).content
        return cell
    }



}

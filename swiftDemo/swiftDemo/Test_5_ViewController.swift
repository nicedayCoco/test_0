//
//  Test_5_ViewController.swift
//  swiftDemo
//
//  Created by han xu on 2018/1/8.
//  Copyright © 2018年 han xu. All rights reserved.
//

import UIKit

class Test_5_ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var dataSource = Array<Date>()
    let refresh = UIRefreshControl()
    var table : UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table = UITableView(frame:self.view.bounds)
        table.frame.origin.y = 44
        self.view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        addNewElementToArray()
        
        refresh.attributedTitle = NSAttributedString(string: "不要拉了")
        refresh.addTarget(self, action: #selector(pullTheRefresh), for: .valueChanged)
        table.addSubview(refresh)
        table.reloadData()
        
    }
    
    func pullTheRefresh(){
        addNewElementToArray()
        refresh.endRefreshing()
        table.reloadData()
    }
    
    func addNewElementToArray(){
        dataSource.insert(NSDate() as Date , at: 0)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style:.default,reuseIdentifier:"cellid")
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy年MM月dd日/HH时mm分ss秒"
        let dateStr = dateFormatter.string(from: dataSource[indexPath.row])
        cell.textLabel?.text = dateStr
        
        return cell
    }
    

 
}

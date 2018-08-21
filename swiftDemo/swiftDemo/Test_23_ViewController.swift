//
//  Test_23_ViewController.swift
//  swiftDemo
//
//  Created by han xu on 2018/2/27.
//  Copyright © 2018年 han xu. All rights reserved.
//

import UIKit

class Test_23_ViewController: SWRevealViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellid")
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var newViewController:UIViewController!
        switch indexPath.row {
        case 0:
            newViewController = FirstViewController()
        case 1:
            newViewController = SecondViewController()
            
        default:
            newViewController = ThirdViewController()
        }
        
        let navigationController = UINavigationController(rootViewController: newViewController)
        self.revealViewController().pushFrontViewController(navigationController, animated: true)
        
        
    }

    var dataSource:Array<String>!
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = ["aaaa","bbbb","cccc"]
        let table = UITableView(frame: self.view.frame)
        table.delegate = self;
        table.dataSource = self;
        self.view.addSubview(table)

        // Do any additional setup after loading the view.
    }



}

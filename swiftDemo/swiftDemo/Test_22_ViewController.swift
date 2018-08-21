//
//  Test_22_ViewController.swift
//  swiftDemo
//
//  Created by han xu on 2018/2/25.
//  Copyright © 2018年 han xu. All rights reserved.
//

import UIKit

class Test_22_ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    private let cellHeight:CGFloat = 66
    var table:UITableView!
    private let dataSource = ["Position","Opacity","Scale","Color","Rotation"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table = UITableView(frame:self.view.frame)
        self.view.addSubview(table)
        table.delegate = self;
        table.dataSource = self;
        table.separatorStyle = .singleLine
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.cellHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return dataSource.count;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: .default, reuseIdentifier: "BasicAnimationReusableUITableViewCell")
        cell.textLabel?.text = self.dataSource[indexPath.row]
        cell.textLabel?.textColor = UIColor.black
        cell.frame.origin.y = self.cellHeight
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(PositionAnimationViewController(), animated: true)
        case 1:
            self.navigationController?.pushViewController(OpacityAnimationViewController(), animated: true)
        case 2:
            self.navigationController?.pushViewController(ScaleAnimationViewController(), animated: true)
        case 3:
            self.navigationController?.pushViewController(ColorAnimationViewController(), animated: true)
        case 4:
            self.navigationController?.pushViewController(RotationAnimationViewController(), animated: true)
            
        default:
            return
        }
    }
    

}

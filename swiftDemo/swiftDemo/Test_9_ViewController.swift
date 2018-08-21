//
//  Test_9_ViewController.swift
//  swiftDemo
//
//  Created by han xu on 2018/1/13.
//  Copyright © 2018年 han xu. All rights reserved.
//

import UIKit

class Test_9_ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIActionSheetDelegate {

    private let cellHeight : CGFloat = 66
    private let colorRatio:CGFloat = 10
    
    
    private let lyric = "when i was young i'd listen to the radio,waiting for my favorite songs,when they played i'd sing along,it make me smile,those were such happy times and not so long ago,how i wondered where they'd gone,but they're back again just like a long lost friend,all the songs i love so well,every shalala every wo'wo,still shines,every shing-a-ling-a-ling"
    var table:UITableView!
    
    private var actionController:UIAlertController!
    private var dataSource:Array<String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        table = UITableView(frame:self.view.frame)
        self.view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        self.dataSource = lyric.components(separatedBy: ",")
        
        actionController = UIAlertController(title:"",message:"",preferredStyle:.alert)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        table.reloadData()
        let cells = table.visibleCells
        let tableHeight:CGFloat = table.bounds.size.height
        
        for (index,cell) in cells.enumerated() {
            cell.frame.origin.y = tableHeight
            UIView.animate(withDuration: 1.0, delay: 0.04*Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.frame.origin.y = 0
            }, completion: nil)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.cellHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "animationInTableViewCell")
        cell.textLabel?.text = self.dataSource[indexPath.row]
        cell.textLabel?.textColor = UIColor.white
        let bgView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.cellHeight))
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bgView.frame
        let lowerColor:CGColor = UIColor(red: (CGFloat(indexPath.row * 2) * self.colorRatio)/255.0, green: 1.0, blue: (CGFloat(indexPath.row * 2) * self.colorRatio)/255.0, alpha: 1).cgColor
        let upperColor:CGColor = UIColor(red: (CGFloat(indexPath.row * 2) * self.colorRatio + self.colorRatio)/255.0, green: 1.0, blue: (CGFloat(indexPath.row * 2) * self.colorRatio + self.colorRatio)/255.0, alpha: 1).cgColor
        
        gradientLayer.colors = [lowerColor,upperColor]
        bgView.layer.addSublayer(gradientLayer)
        cell.addSubview(bgView)
        cell.sendSubview(toBack: bgView)
        cell.frame.origin.y = self.cellHeight
        cell.isUserInteractionEnabled = true
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let likeAction = UITableViewRowAction(style: .normal, title: "点赞") { (action, index) in
            self.actionController.message = "Thanks for your Love"
            self.showAlertController()
        }
//        likeAction.
        likeAction.backgroundColor = UIColor.gray
        
        let dislikeAction = UITableViewRowAction(style: .default, title: "不喜欢") { (action, index) in
            self.actionController.message = "Tell me why!!!"
            self.showAlertController()
        }
        dislikeAction.backgroundColor = .gray
        
        let unknowAction = UITableViewRowAction(style: .destructive, title: "不知道") { (action, index) in
            self.actionController.message = "what do you mean?"
            self.showAlertController()
        }
        unknowAction.backgroundColor = UIColor.gray
        return [likeAction,dislikeAction,unknowAction]
    }
    
    func showAlertController(){
        self.present(self.actionController, animated: true) {
            if #available(iOS 10.0, *) {
                let dismissTimer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false, block: { (time) in
                    self.actionController.dismiss(animated: true, completion: nil)
                })
                
                RunLoop.main.add(dismissTimer, forMode: .commonModes)
            } else {
                // Fallback on earlier versions
            }
            
        }
        
    }
    
    
}

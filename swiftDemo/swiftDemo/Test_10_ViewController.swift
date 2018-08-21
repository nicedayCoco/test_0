//
//  Test_10_ViewController.swift
//  swiftDemo
//
//  Created by han xu on 2018/1/15.
//  Copyright © 2018年 han xu. All rights reserved.
//

import UIKit

class Test_10_ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate {

    

    var table:UITableView!
    var bannerImgView:UIImageView!
    private let lyric = "when i was young i'd listen to the radio,waiting for my favorite songs,when they played i'd sing along,it make me smile"
    private let cellHeight:CGFloat = 66
    private let colorRatio:CGFloat = 10
    private var dataSource:Array<String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table = UITableView()
        table.frame = CGRect(x: 0, y: self.view.frame.width + 10, width: self.view.frame.width, height: self.view.frame.height - 10 - self.view.frame.width)
        self.view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        
        bannerImgView = UIImageView(image: #imageLiteral(resourceName: "avatar.jpg"))
        bannerImgView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.width)
        self.view.addSubview(bannerImgView)
        
        self.dataSource = lyric.components(separatedBy: ",")
        
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

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.cellHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "animationInTableViewCell")
        cell.textLabel?.text = self.dataSource[indexPath.row]
        cell.textLabel?.textColor = UIColor.black
        cell.frame.origin.y = self.cellHeight
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let maxOffsetY = table.frame.height
        let validataOffsetY = -offsetY / maxOffsetY
        let scaleFactor = 1 + validataOffsetY
        bannerImgView.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
        
        
    }
    
}

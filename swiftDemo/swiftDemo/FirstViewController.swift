//
//  FirstViewController.swift
//  swiftDemo
//
//  Created by han xu on 2018/2/27.
//  Copyright © 2018年 han xu. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .green
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        // Do any additional setup after loading the view.
    }



}

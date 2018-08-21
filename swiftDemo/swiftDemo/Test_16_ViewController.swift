//
//  Test_16_ViewController.swift
//  swiftDemo
//
//  Created by han xu on 2018/2/5.
//  Copyright © 2018年 han xu. All rights reserved.
//

import UIKit

class Test_16_ViewController: UIViewController {

    let buttonHeight:CGFloat = 56
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = UIColor(red:25/255.0,green:153/255.0,blue:3/255.0, alpha:1)

        let loginButton = UIButton(frame:CGRect(x: 0, y: (self.view.frame.size.height - buttonHeight), width: (self.view.frame.width/2.0), height: buttonHeight))
        loginButton.setTitle("LOG IN", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        loginButton.backgroundColor = UIColor(red: 35/255.0, green: 36/255.0, blue: 38/255.0, alpha: 1)
        self.view.addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        
        let signupButton = UIButton(frame:CGRect(x: self.view.frame.width/2.0, y: (self.view.frame.size.height - buttonHeight), width: self.view.frame.width / 2.0, height: buttonHeight))
        signupButton.setTitle("SIGN UP", for: .normal)
        signupButton.setTitleColor(.white, for: .normal)
        signupButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        signupButton.backgroundColor = UIColor(red: 42/255.0, green: 183/255.0, blue: 90/255.0, alpha: 1)
        self.view.addSubview(signupButton)
        
        
    }

    func loginAction () {
        let loginVC = Test_16_LoginViewController()
        self.navigationController?.pushViewController(loginVC, animated:true)
        
    }
    

}

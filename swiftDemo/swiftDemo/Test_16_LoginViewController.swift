//
//  Test_16_LoginViewController.swift
//  swiftDemo
//
//  Created by han xu on 2018/2/5.
//  Copyright © 2018年 han xu. All rights reserved.
//

import UIKit

class Test_16_LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 25/255.0, green: 153/255.0, blue: 3/255.0, alpha: 1)
        self.view.alpha = 0

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let userNameInputField = UITextField(frame:CGRect(x: -270, y: 50, width: 270, height: 40))
        userNameInputField.borderStyle = .roundedRect
        userNameInputField.placeholder = "UserName"
        self.view.addSubview(userNameInputField)
        
        let pswInputField = UITextField(frame:CGRect(x: -270, y: 100, width: 270, height: 40))
        pswInputField.borderStyle = .roundedRect
        pswInputField.placeholder = "PassWord"
        self.view.addSubview(pswInputField)
        
        let loginButton = UIButton(frame:CGRect(x: -125, y: 160, width: 125, height: 40))
        loginButton.setTitle("Login", for: UIControlState.normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = UIColor(red: 22/255.0, green: 139/255.0, blue: 3/255.0, alpha: 1)
        self.view.addSubview(loginButton)
        
        UIView.animate(withDuration: 0.5) {
            self.view.alpha = 1
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.6, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: .allowAnimatedContent, animations: {
            
            userNameInputField.center.x = self.view.center.x
            
        }, completion: nil)
        
        
        UIView.animate(withDuration: 0.5, delay: 0.8, usingSpringWithDamping: 0.9, initialSpringVelocity: 2, options: .allowAnimatedContent, animations: {
            
            pswInputField.center.x = self.view.center.x
            
        }, completion: nil)
        

        UIView.animate(withDuration: 0.5, delay: 1, options: .curveEaseIn, animations: {
            loginButton.center.x = self.view.center.x
        }) { (isComplete) in
            
            UIView.animate(withDuration: 1, delay: 0.5, usingSpringWithDamping: 0.1, initialSpringVelocity: 2, options: .allowAnimatedContent, animations: {
                
                loginButton.frame.size.width = 180
                loginButton.center.x = self.view.center.x
            }, completion: nil)
        }
            
        }
    


}

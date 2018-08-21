//
//  Test_14_ViewController.swift
//  swiftDemo
//
//  Created by han xu on 2018/1/17.
//  Copyright © 2018年 han xu. All rights reserved.
//

import UIKit

class Test_14_ViewController: UIViewController {

    let buttonHeight:CGFloat = 56
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let logoImageView = UIImageView(frame: CGRect(x: 0, y: 50, width: 334, height: 101))
        logoImageView.image = #imageLiteral(resourceName: "avatar.jpg")
        self.view.addSubview(logoImageView)
        logoImageView.center.x = self.view.center.x
        
        let loginButton = UIButton(frame: CGRect(x: 0, y: (self.view.frame.size.height - buttonHeight), width: self.view.frame.width/2.0, height: buttonHeight))
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.setTitle("LOG IN", for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        loginButton.backgroundColor = UIColor(red: 35/255.0, green: 36/255.0, blue: 38/255.0, alpha: 1)
        self.view.addSubview(loginButton)
        
        let signUpButton = UIButton(frame: CGRect(x: self.view.frame.width/2.0, y: (self.view.frame.size.height - buttonHeight), width: self.view.frame.width/2.0, height: buttonHeight))
        
        signUpButton.setTitleColor(UIColor.white, for: .normal)
        signUpButton.setTitle("SIGN UP", for: .normal)
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        signUpButton.backgroundColor = UIColor(red: 42/255.0, green: 183.0/255.0, blue: 90/255.0, alpha: 1)
        self.view.addSubview(signUpButton)
        
    }

    func setupVideoBackground() {
        
        let url = NSURL.fileURL(withPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
        
//        video
        
    }

}

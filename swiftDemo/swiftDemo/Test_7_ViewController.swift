//
//  Test_7_ViewController.swift
//  swiftDemo
//
//  Created by han xu on 2018/1/9.
//  Copyright © 2018年 han xu. All rights reserved.
//

import UIKit

class Test_7_ViewController: UIViewController,UIScrollViewDelegate {

    var imageView:UIImageView!
    var scrollView:UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView = UIImageView(frame:self.view.bounds)
        imageView.image = UIImage(named:"samplePhoto.jpeg")
        imageView.isUserInteractionEnabled = true
        scrollView = UIScrollView(frame:self.view.frame)
        scrollView.maximumZoomScale = 4.0
        scrollView.minimumZoomScale = 1
        scrollView.backgroundColor = .black
        scrollView.contentSize = imageView.bounds.size
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        scrollView.addSubview(imageView)
    }

    @nonobjc func viewforZooming(in scrollView:UIScrollView) -> UIView? {
        return imageView
    }
  
    
}

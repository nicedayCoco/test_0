//
//  Test_3_ViewController.swift
//  swiftDemo
//
//  Created by han xu on 2018/1/5.
//  Copyright © 2018年 han xu. All rights reserved.
//

import UIKit
import CoreLocation

class Test_3_ViewController: UIViewController,CLLocationManagerDelegate {

    let locationMangeger = CLLocationManager()
    let geocoder = CLGeocoder()
    let locationLabel = UILabel()
    let locationStrLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bgImageView = UIImageView(frame:self.view.bounds)
        bgImageView.image = #imageLiteral(resourceName: "phoneBg")
        self.view.addSubview(bgImageView)
        
        let blurEffect:UIBlurEffect = UIBlurEffect(style:.light)
        let blurView:UIVisualEffectView = UIVisualEffectView(effect:blurEffect)
        blurView.frame = self.view.bounds
        self.view.addSubview(blurView)
        
        locationMangeger.delegate = self
        
        locationLabel.frame = CGRect(x:0,y:50,width:self.view.bounds.width,height:100)
        locationLabel.textAlignment = .center
        locationLabel.textColor = .white
        self.view.addSubview(locationLabel)
        
        locationStrLabel.frame = CGRect(x:0,y:100,width:self.view.bounds.width,height:50)
        locationStrLabel.textAlignment = .center
        locationStrLabel.textColor = .white
        self.view.addSubview(locationStrLabel)
        
        let findMyLocationBtn = UIButton(type:.custom)
        findMyLocationBtn.frame = CGRect(x:50,y:self.view.bounds.height - 80,width:self.view.bounds.width - 100,height:50)
        findMyLocationBtn.setTitle("Find My Position", for: .normal)
        findMyLocationBtn.setTitleColor(.white, for: .normal)
        findMyLocationBtn.addTarget(self, action: #selector(findMyLocation), for: .touchUpInside)
        self.view.addSubview(findMyLocationBtn)
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func findMyLocation() {
        locationMangeger.requestAlwaysAuthorization()
        locationMangeger.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let locations : NSArray = locations as NSArray
        let currentLocation = locations.lastObject as! CLLocation
        let locationStr = "lat:\(currentLocation.coordinate.latitude)lng:\(currentLocation.coordinate.longitude)"
        locationStrLabel.text = locationStr
        reverseGeocode(location: currentLocation)
        locationMangeger.stopUpdatingLocation()
        
    }

    func reverseGeocode(location:CLLocation) {
        geocoder.reverseGeocodeLocation(location) { (placeMark, error) in
            if error == nil {
                let temArray = placeMark! as NSArray
                let mark = temArray.firstObject as! CLPlacemark
                let addressDictionary = mark.addressDictionary! as NSDictionary
                let country = addressDictionary.value(forKey: "Country") as!String
                let city = addressDictionary.object(forKey: "City") as! String
                let street = addressDictionary.object(forKey: "Street") as! String
                let finaAddress = "\(street),\(city),\(country)"
                self.locationStrLabel.text = finaAddress
            }
        }
    }
}

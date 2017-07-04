//
//  ViewController.swift
//  WhereAreYou?
//
//  Created by Basila Nathan on 7/3/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var latitudeLabel: UILabel!
    @IBOutlet weak var longitudeLabel: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var altitudeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    
    var manager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager.delegate = self
        
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        manager.requestWhenInUseAuthorization()
        
        manager.startUpdatingLocation()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //print(locations)
        
        let location = locations[0]
        
        self.latitudeLabel.text = String(location.coordinate.latitude)
        
        self.longitudeLabel.text = String(location.coordinate.longitude)
        
        self.courseLabel.text = String(location.course)
        
        self.speedLabel.text = String(location.speed)
        
        self.altitudeLabel.text = String(location.altitude)
        
        CLGeocoder().reverseGeocodeLocation(location) { (placemarks, error) in
            
            if error != nil {
                
                print(error)
                
            } else {
                
                if let placemarks = placemarks?[0] {
                    
                    var address = ""
                    
                    if placemarks.subThoroughfare != nil {
                        
                        address += placemarks.subThoroughfare! + " "
                        
                    }
                    
                    if placemarks.thoroughfare != nil {
                        
                        address += placemarks.thoroughfare! + "\n"
                        
                    }
                    
                    if placemarks.locality != nil {
                        
                        address += placemarks.locality! + "\n"
                        
                    }
                    
                    if placemarks.administrativeArea != nil {
                        
                        address += placemarks.administrativeArea! + "\n"
                        
                    }
                    
                    if placemarks.postalCode != nil {
                        
                        address += placemarks.postalCode! + "\n"
                        
                    }
                    
                    if placemarks.country != nil {
                        
                        address += placemarks.country! + "\n"
                        
                    }
                    
                    self.addressLabel.text = address
                    
                }
                
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  UserLocation
//
//  Created by Basila Nathan on 7/3/17.
//  Copyright © 2017 Basila Nathan. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager.delegate = self //allows the view controller to control the location manager.
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.requestWhenInUseAuthorization() //request authorization
        
        locationManager.startUpdatingLocation() //will start monitoring the location as long as the app is in use!!
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //to get the location
    //didUpdateLocatio method will be called, and you will be able to do something with that location!
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        let userLocation: CLLocation = locations[0]
        
        print(locations)
        
        //let latitude = userLocation.coordinate.latitude
        
        //let longitude = userLocation.coordinate.longitude
        
        //let latDelta: CLLocationDegrees = 0.01
        
        //let lonDelta: CLLocationDegrees = 0.01
        
        //let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        
        //let location = CLLocationCoordinate2DMake(latitude, longitude)
        
        //let region = MKCoordinateRegion(center: location, span: span)
        
        //self.map.setRegion(region, animated: true)
        
        //ADDRESS DETAILS FROM A LOCATION USING GEOCODER.REVERSE
        
        CLGeocoder().reverseGeocodeLocation(userLocation) { (placemarks, error) in //going from a location to an address
        
            if error != nil {
                
                print(error)
                
            } else {
                
                if let placemark = placemarks?[0] {
                    
                    print(placemark)
                    
                    //number
                    
                    var subThoroughfare = ""
                    
                    if placemark.subThoroughfare != nil {
                        
                        subThoroughfare = placemark.subThoroughfare!
                        
                    }
                    
                    //street
                    var thoroughfare = ""
                    
                    if placemark.thoroughfare != nil {
                        
                        thoroughfare = placemark.thoroughfare!
                        
                    }
                    
                    //place
//                    
//                    var subLocality = ""
//                    
//                    if placemark.subLocality != nil {
//                        
//                        subLocality = placemark.subLocality!
//                        
//                    }
                    
                    //city 
                    
                    var locality = ""
                    
                    if placemark.locality != nil {
                        
                        locality = placemark.locality!
                        
                    }
                    
                    //city
                    
//                    var subAdministrativeArea = ""
//                    
//                    if placemark.subAdministrativeArea != nil {
//                        
//                        subAdministrativeArea = placemark.subAdministrativeArea!
//                    
//                    
//                }
                    
                    //state
                    
                    var administrativeArea = ""
                    
                    if placemark.administrativeArea != nil {
                        
                        administrativeArea = placemark.administrativeArea!
                        
                        
                    }
                    
                    
                    
                    //postal code
                    
                    var postalCode = ""
                    
                    if placemark.postalCode != nil {
                        
                        postalCode = placemark.postalCode!
                        
                        
                    }
                    
                    //country
                    
                    var country = ""
                    
                    if placemark.country != nil {
                        
                        country = placemark.country!
                        
                        
                    }
                    
                    //combine
                    
                    print(subThoroughfare + " " + thoroughfare + "\n" + locality + "\n" + administrativeArea + "\n" +  postalCode + "\n" + country)
                
            }
        }
        
        
    }


    }
}


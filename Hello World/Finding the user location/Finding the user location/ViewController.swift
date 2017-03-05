//
//  ViewController.swift
//  Finding the user location
//
//  Created by arjun gupta on 04/03/17.
//  Copyright © 2017 arjun gupta. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit


class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var map: MKMapView!
    
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //print(locations)
       
        let userLocation: CLLocation = locations[0]
//        let latitude = userLocation.coordinate.latitude
//        let longitude = userLocation.coordinate.longitude
        
//        let latDelta: CLLocationDegrees = 0.05
//        let lonDelta: CLLocationDegrees = 0.05
        
//        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        
//        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//        let region = MKCoordinateRegion(center: location, span: span)
//        
//        self.map.setRegion(region, animated: true)
        
        CLGeocoder().reverseGeocodeLocation(userLocation){
         (placemarks, error) in
            if error != nil{
                print(error!)
            }
            else{
                if let placemark = placemarks?[0]{
                    
                    //print(placemark)
                    //print(placemark.country!)
                    
                    var subThroughfare=""
                   
                    if placemark.subThoroughfare != nil{
                        subThroughfare = placemark.subThoroughfare!
                        
                    }
                    var throughfare=""
                    if placemark.thoroughfare != nil{
                        throughfare = placemark.thoroughfare!
                        
                    }
                    
                    var subLocality=""
                    if placemark.subLocality != nil{
                        subLocality = placemark.subLocality!
                        
                    }
                    
                    var subAdministrativeArea=""
                    if placemark.subAdministrativeArea != nil{
                        subAdministrativeArea = placemark.subAdministrativeArea!
                    }
                    var postalCode=""
                    if placemark.postalCode != nil{
                        postalCode = placemark.postalCode!
                    }
                    
                    var country=""
                    if placemark.country != nil{
                        country = placemark.country!
                    }
                    
                    print(subThroughfare + throughfare + "\n" + subLocality + "\n" + subAdministrativeArea + "\n" + postalCode + "\n" + country )
                    
                    
                    
                }
            }
            
        }
        
        
        
        
    }

}


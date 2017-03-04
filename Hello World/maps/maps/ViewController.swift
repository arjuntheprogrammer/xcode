//
//  ViewController.swift
//  maps
//
//  Created by arjun gupta on 04/03/17.
//  Copyright © 2017 arjun gupta. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    func longpress(gestureRecognizer: UIGestureRecognizer){
        let touchPoint = gestureRecognizer.location(in: self.map)
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "New place"
        
        annotation.subtitle = "may be ill here"
        
        map.addAnnotation(annotation)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // taj mahal 28.6323504,77.3726377
        
        
        let latitude: CLLocationDegrees = 27.1
        let longitude: CLLocationDegrees = 77.37
        
        let latDelta: CLLocationDegrees = 0.05
        let lonDelta: CLLocationDegrees = 0.05
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region: MKCoordinateRegion = MKCoordinateRegion(center: location, span: span)
        map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        
        annotation.title = "Taj Mahal"
        annotation.subtitle = "located in Agra"
        annotation.coordinate = location
        map.addAnnotation(annotation)
        
        let uiLongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(ViewController.longpress(gestureRecognizer:)))
        uiLongPressGestureRecognizer.minimumPressDuration = 2
        map.addGestureRecognizer(uiLongPressGestureRecognizer)
        
        
        
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


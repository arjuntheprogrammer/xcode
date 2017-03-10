//
//  SwipingViewController.swift
//  ParseStarterProject-Swift
//
//  Created by arjun gupta on 08/03/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit
import Parse


class SwipingViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var displayedUserID = ""
    
    
    
    func wasDragged(gestureRecognizer: UIPanGestureRecognizer ){
        //print("was dragged")
        let translation = gestureRecognizer.translation(in: view)
        let label = gestureRecognizer.view!
        
        label.center = CGPoint(x: self.view.bounds.width / 2 + translation.x, y: self.view.bounds.height / 2 + translation.y)
        let xFromCenter = label.center.x - self.view.bounds.width / 2
        
        
        var rotation = CGAffineTransform(rotationAngle: xFromCenter / 200)
        
        let scale = min(abs(100 / xFromCenter),1)
        
        var streatchAndRotation = rotation.scaledBy(x: scale, y: scale)
        label.transform = streatchAndRotation
        
        
        if gestureRecognizer.state == UIGestureRecognizerState.ended{
            
            var acceptedOrRejected = ""
            
        
            if label.center.x < 100{
                acceptedOrRejected = "rejected"
                print("not chosen")
                
            }
            else if label.center.x > self.view.bounds.width - 100{
                acceptedOrRejected = "accepted"
                print("chosen")
            }
            
            if acceptedOrRejected != "" && displayedUserID != ""{
                PFUser.current()?.addUniqueObjects(from: [displayedUserID], forKey: acceptedOrRejected)
                PFUser.current()?.saveInBackground(block: { (success, error) in
                    self.updateImage()
                    
                })
                updateImage()
            }
            
            rotation = CGAffineTransform(rotationAngle: 0)
            streatchAndRotation = rotation.scaledBy(x: 1, y: 1)
            label.transform = streatchAndRotation
            
            label.center = CGPoint(x: self.view.bounds.width / 2 , y: self.view.bounds.height/2)
        }
        //print(translation)
    }
    
    func updateImage(){
        let query = PFUser.query()
        query?.whereKey("isFemale", equalTo: (PFUser.current()?["isInterestedInWomen"])!)
        query?.whereKey("isInterestedInWomen", equalTo: (PFUser.current()?["isFemale"])!)
        
        var ignoredUsers = [""]
        if let acceptedUser = PFUser.current()?["accepted"]{
            ignoredUsers += acceptedUser as! Array
            
        }
        if let rejectedUser = PFUser.current()?["rejected"]{
            ignoredUsers += rejectedUser as! Array
            
        }
        
        query?.whereKey("objectId", notContainedIn: ignoredUsers)
        
        if let latitude = (PFUser.current()?["location"] as AnyObject).latitude {
            if let longitude = (PFUser.current()?["location"] as AnyObject).longitude{
                query?.whereKey("location", withinGeoBoxFromSouthwest: PFGeoPoint(latitude:latitude-10,longitude: longitude-10), toNortheast: PFGeoPoint(latitude:latitude+10,longitude: longitude+10   ))
            }
        }
        
        query?.limit = 1
        
        query?.findObjectsInBackground(block: { (objects, error) in
            if let users = objects{
                for object in users{
                    if let user = object as? PFUser{
                        
                        print("here inside")
                        
                        self.displayedUserID = user.objectId!
                        
                        let imageFile = user["photo"] as! PFFile
                        
                        imageFile.getDataInBackground(block: { (data, error) in
                            if let imageData = data{
                                self.imageView.image = UIImage(data: imageData)
                                
                            }
                        })
                    }
            }
            }
        })
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(self.wasDragged(gestureRecognizer:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(gesture)

        PFGeoPoint.geoPointForCurrentLocation { (geopoint, error) in
            print(geopoint)
            
            if let geopoint = geopoint{
                
                PFUser.current()?["location"] = geopoint
                PFUser.current()?.saveInBackground()
                
            }
        }
        
        updateImage()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "logoutSegue"{
            PFUser.logOut()
            
        }
            
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

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
            if label.center.x < 100{
                print("not chosen")
            }
            else if label.center.x > self.view.bounds.width - 100{
                print("chosen")
            }
            
            rotation = CGAffineTransform(rotationAngle: 0)
            streatchAndRotation = rotation.scaledBy(x: 1, y: 1)
            label.transform = streatchAndRotation
            
            label.center = CGPoint(x: self.view.bounds.width / 2 , y: self.view.bounds.height/2)
        }
        //print(translation)
    }
    
    func 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(self.wasDragged(gestureRecognizer:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(gesture)


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

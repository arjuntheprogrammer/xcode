//
//  ViewController.swift
//  Swipe Demo
//
//  Created by arjun gupta on 08/03/17.
//  Copyright © 2017 arjun gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var label = UILabel(frame: CGRect(x: self.view.bounds.width/2 -  100, y: self.view.bounds.height / 2 - 50, width: 200, height: 100 ))
        label.text = "Drag me"
        label.textAlignment = NSTextAlignment.center
        view.addSubview(label)
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(self.wasDragged(gestureRecognizer:)))
        
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(gesture)
        
        
        
    }
    func wasDragged(gestureRecognizer: UIPanGestureRecognizer ){
        //print("was dragged")
        let translation = gestureRecognizer.translation(in: view)
        let label = gestureRecognizer.view!
        
        label.center = CGPoint(x: self.view.bounds.width / 2 + translation.x, y: self.view.bounds.height / 2 + translation.y)
        let xFromCenter = label.center.x - self.view.bounds.width / 2
        
        
        let rotation = CGAffineTransform(rotationAngle: xFromCenter / 200)
        
        let streatchAndRotation = rotation.scaledBy(x: 0.9, y: 0.9)
        label.transform = streatchAndRotation
        
        
        if gestureRecognizer.state == UIGestureRecognizerState.ended{
            if label.center.x < 100{
                print("not chosen")
            }
            else if label.center.x > self.view.bounds.width - 100{
                print("chosen")
            }
            label.center = CGPoint(x: self.view.bounds.width / 2 , y: self.view.bounds.height/2)
        }
        //print(translation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


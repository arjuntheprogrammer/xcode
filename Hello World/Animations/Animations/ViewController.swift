//
//  ViewController.swift
//  Animations
//
//  Created by arjun gupta on 03/03/17.
//  Copyright © 2017 arjun gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func Fade(_ sender: Any) {
        image.alpha = 0
        UIView.animate(withDuration: 1, animations: {
            self.image.alpha = 1
        })
        
    }
    @IBAction func Slide(_ sender: Any) {
        image.center = CGPoint(x: image.center.x - 500 , y: image.center.y)
        UIView.animate(withDuration:2){
            self.image.center = CGPoint(x: self.image.center.x + 500 , y: self.image.center.y)
            
        }
    }
    @IBAction func Grow(_ sender: Any) {
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        UIView.animate(withDuration:2){
            self.image.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
            
        }
        
    }
    @IBOutlet weak var button: UIButton!
    var counter = 1
    var timer = Timer()
    var isAnimating = false
    
    @IBAction func next(_ sender: Any) {
        if isAnimating {
            timer.invalidate()
            button.setTitle("Start animation", for: [])
            isAnimating = false
            
        }
        else{
            timer = Timer.scheduledTimer(timeInterval: 0.1,target: self, selector : #selector(ViewController.animate) , userInfo:nil, repeats: true)
            
            button.setTitle("Stop animation", for: [])
            isAnimating = true

        }
    }
    
    
    func animate(){
        if counter == 10{
            counter = 0
        }
        
        counter+=1
        
        image.image = UIImage(named: "frame_\(counter)_delay-0.04s.gif")
        
    
    }
    
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


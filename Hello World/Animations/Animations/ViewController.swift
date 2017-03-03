//
//  ViewController.swift
//  Animations
//
//  Created by arjun gupta on 03/03/17.
//  Copyright © 2017 arjun gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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


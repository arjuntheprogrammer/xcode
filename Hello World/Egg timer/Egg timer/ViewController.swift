//
//  ViewController.swift
//  Egg timer
//
//  Created by arjun gupta on 02/03/17.
//  Copyright © 2017 arjun gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var timer = Timer()
    var time=210
    func decreaseTimer(){
       
        
        if time>0 {
            time -= 1
            TimerLabel.text=String(time)
            
        }
        else{
            timer.invalidate()
        }
        
    }
    
    @IBAction func reset(_ sender: Any) {
        time=210
        TimerLabel.text=String(time)
        
    }
    
    @IBAction func minus10(_ sender: Any) {
        if time>10 {
        
            time-=10
            TimerLabel.text=String(time)
            
        }
        
    }
    @IBAction func plus10(_ sender: Any) {
        time+=10
        TimerLabel.text=String(time)
    }
    @IBAction func pause(_ sender: Any) {
        timer.invalidate()
        
    }
    
    @IBOutlet weak var TimerLabel: UILabel!
    
    @IBAction func play(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.decreaseTimer), userInfo: nil, repeats: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


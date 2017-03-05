//
//  ViewController.swift
//  Sound Shaker
//
//  Created by arjun gupta on 05/03/17.
//  Copyright © 2017 arjun gupta. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
        var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
    
        if event?.subtype == UIEventSubtype.motionShake{
            
            let soundArray = ["a1", "a2", "a3", "a4", "a5", "a6", "a7"]
            
            let randomNumber = Int(arc4random_uniform(UInt32(soundArray.count)))
            
            
            let fileLocation = Bundle.main.path(forResource: "bell sounds/"+soundArray[randomNumber], ofType: "mp3")
            
            

            do {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: fileLocation!))
                
                player.play()
            }
            catch{
                // process error
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


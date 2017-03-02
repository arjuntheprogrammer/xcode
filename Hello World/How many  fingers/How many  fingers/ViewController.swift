//
//  ViewController.swift
//  How many  fingers
//
//  Created by arjun gupta on 22/02/17.
//  Copyright © 2017 arjun gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fingerTextField: UITextField!
    @IBOutlet weak var ResultLabel: UILabel!
    @IBAction func guess(_ sender: Any) {
        print("guess pressed")
        let diceroll = String(arc4random_uniform(6))
        
        if fingerTextField.text == diceroll{
            ResultLabel.text="you are right,  it was a " + (diceroll) + "."
            

            
        }
        else{
            ResultLabel.text="Wrong! it was a " + (diceroll) + "."
            	
        }
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


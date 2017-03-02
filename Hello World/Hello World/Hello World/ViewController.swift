//
//  ViewController.swift
//  Hello World
//
//  Created by arjun gupta on 21/02/17.
//  Copyright © 2017 arjun gupta. All rights reserved.
//

import UIKit
class ViewController: UIViewController {

    
    @IBOutlet weak var TextField1: UITextField!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var TextField2: UITextField!
    
    @IBOutlet weak var Output: UILabel!
    @IBAction func ButtonTap(_ sender: Any) {
        Label2.text=TextField1.text
        
        let out=Int(TextField2.text!)!*10
        
    
        
        Output.text=String(out)
        print("button tapped!!!")
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


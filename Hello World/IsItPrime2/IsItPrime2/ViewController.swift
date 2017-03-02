//
//  ViewController.swift
//  IsItPrime2
//
//  Created by arjun gupta on 02/03/17.
//  Copyright © 2017 arjun gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func isitprime(_ sender: Any) {
        if let userEnteredString = numberTextField.text{
            let userEnteredInteger = Int(userEnteredString)
            if let number = userEnteredInteger{
                var isPrime = true
                if number == 1{
                    isPrime=true
                }
                var i=2
                while i<number {
                    if number % i==0{
                        isPrime = false
                    }
                    i+=1
                    
                }
                if isPrime {
                    resultLabel.text = "\(number) is prime"
                }
                else{
                    resultLabel.text = "\(number) is not prime"

                }
            }
            else{
                resultLabel.text="please enter a positive whole number"
                
            }
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


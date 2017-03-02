//
//  SecondViewController.swift
//  To do list
//
//  Created by arjun gupta on 02/03/17.
//  Copyright © 2017 arjun gupta. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var ItemTextField: UITextField!
    
    @IBAction func Add(_ sender: Any) {
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        var items:[String]
        
        
        if let tempitems = itemsObject as? [String] {
            items = tempitems
            
            items.append(ItemTextField.text!)
            
        }
        else{
            items=[ItemTextField.text!]
            
            
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        
        ItemTextField.text = ""

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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


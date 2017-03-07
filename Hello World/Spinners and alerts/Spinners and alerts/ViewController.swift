//
//  ViewController.swift
//  Spinners and alerts
//
//  Created by arjun gupta on 07/03/17.
//  Copyright © 2017 arjun gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func createAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Hey there!", message: "Are you sure", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            print("button pressed")
            self.dismiss(animated: true, completion: nil)
        }) )
        
        alertController.addAction(UIAlertAction(title: "No", style: .default, handler: { (action) in
            print("no button pressed")
            self.dismiss(animated: true, completion: nil)
        }) )
        
        self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func pauseApp(_ sender: Any) {
    }
    @IBAction func restoreApp(_ sender: Any) {
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


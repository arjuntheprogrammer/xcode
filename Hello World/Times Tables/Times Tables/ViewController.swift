//
//  ViewController.swift
//  Times Tables
//
//  Created by arjun gupta on 02/03/17.
//  Copyright © 2017 arjun gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 50;
        
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        let value=String((Int(Slider.value*20))*(indexPath.row + 1) )
        //print(Int(Slider.value*20))
        cell.textLabel?.text = value
        return cell
    
    }
    
    
    @IBOutlet weak var Table: UITableView!
    @IBAction func SliderChanged(_ sender: Any) {
        Table.reloadData()
        print(Slider.value)
        
    }
    
    @IBOutlet weak var Slider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


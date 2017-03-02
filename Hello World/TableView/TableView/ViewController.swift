//
//  ViewController.swift
//  TableView
//
//  Created by arjun gupta on 02/03/17.
//  Copyright © 2017 arjun gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    let cellContent = ["rob", "arjun", "tommy", "ralph"]
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return cellContent.count
        
    }
    
    
    
    
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        cell.textLabel?.text = cellContent[indexPath.row]
        
        return cell
        
        
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


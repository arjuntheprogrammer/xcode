//
//  FirstViewController.swift
//  To do list
//
//  Created by arjun gupta on 02/03/17.
//  Copyright © 2017 arjun gupta. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController , UITableViewDataSource, UITableViewDelegate{
    
    var items:NSMutableArray = []
    
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return items.count
        
    }
    
    @IBOutlet weak var table: UITableView!
    
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: UITableViewCellStyle.default , reuseIdentifier: "Cell")
        var cellLabel = ""
        if let tempLabel = items[indexPath.row] as? String{
            cellLabel = tempLabel
            
        }
        cell.textLabel?.text = cellLabel
        
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        
        
        if let tempitems = itemsObject as? NSMutableArray {
            items = tempitems
            
            
        }
        table.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


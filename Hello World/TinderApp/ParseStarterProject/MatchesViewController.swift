//
//  MatchesViewController.swift
//  ParseStarterProject-Swift
//
//  Created by arjun gupta on 10/03/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit
import Parse
class MatchesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    var images = [UIImage]()
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return images.count
        
    }
    
   
    @IBOutlet weak var tableView: UITableView!
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MatchesTableViewCell
        cell.userImageView.image = images[indexPath.row]
        cell.messageLabel.text = "You haven't any message yet."
        //cell.textLabel?.text = "Test"
        return cell
    }
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        let query = PFUser.query()
        query?.whereKey("accepted", contains: PFUser.current()?.objectId)
        query?.whereKey("objectId", containedIn:  PFUser.current()?["accepted"] as! [String])
        query?.findObjectsInBackground(block: { (objects, error) in
            if let users = objects{
                for object in users{
                    if let user = object as? PFUser{
                        let imageFile = user["photo"] as! PFFile
                        
                        imageFile.getDataInBackground(block: { (data, error) in
                            if let imageData = data{
                                self.images.append(UIImage(data: imageData)!)
                                self.tableView.reloadData()
                                
                            }
                        })
                    }
                }
            }
        })
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  ViewController.swift
//  Core Data Demo
//
//  Created by arjun gupta on 05/03/17.
//  Copyright © 2017 arjun gupta. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        newUser.setValue("komal", forKey: "username")
        newUser.setValue("myPass", forKey: "password")
        newUser.setValue(21, forKey: "age")
        
        do{
            try context.save()
            print("saved")
            
        }
        catch{
            print("there was an error")
        }
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        do{
            let results = try context.fetch(request)
            if results.count > 0{
                for result in results as! [NSManagedObject]{
                    if let username = result.value(forKey: "username") as? String{
                        print(username)
                        
                    }
                }
            }
            else{
                print("No results")
            }
        }
        catch{
            print("couldnt fetch")
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  ViewController.swift
//  Api Demo
//
//  Created by arjun gupta on 05/03/17.
//  Copyright © 2017 arjun gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    @IBAction func submit(_ sender: Any) {
        
        
        if let url = URL(string: "http://samples.openweathermap.org/data/2.5/weather?q=" + cityTextField.text!.replacingOccurrences(of: " ", with: "%20") + ",uk&appid=3b38b91aeb9f6cd43660224bb8a9cb02"){
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil{
                print(error!)
            }
            else{
                if let urlContent = data{
                    do{
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String:Any]
                        print(jsonResult)
                        print(jsonResult["name"]!)
                        
                        
                        if let weather = jsonResult["weather"] as? [[String: Any]], let description = weather.first?["description"] as? String {
                            //print(description)
                            DispatchQueue.main.sync(execute: {
                                self.resultLabel.text = description
                                
                            })
                            
                        }
                        
                        //                        if let description = jsonResult["weather"]?[0]["description"]{
                        //
                        //                            print(description)
                        //
                        //                        }
                        
                    }
                    catch{
                        print("json processing failed")
                    }
                }
                
            }
            
        }
        task.resume()
      }
        else{
            resultLabel.text = "cant find weather for that city, try another"
            
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


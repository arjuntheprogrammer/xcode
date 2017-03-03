//
//  ViewController.swift
//  Whats the weather
//
//  Created by arjun gupta on 03/03/17.
//  Copyright © 2017 arjun gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func getWeather(_ sender: Any) {
        
        if let url = URL(string: "http://www.weather-forecast.com/locations/" + cityTextField.text!.replacingOccurrences(of: " ", with: "-" ) + "/forecasts/latest"){
        let request = NSMutableURLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            
            var message = ""
            if error != nil{
                print(error!)
            }
                
            else{
                if let unwrappedData = data{
                    let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                    //print(dataString!)
                    var stringSeparater = "Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">"
                    if let contentArray = dataString?.components(separatedBy: stringSeparater){
                        
                        if contentArray.count > 1{
                            stringSeparater="</span>"
                            let newContentArray = contentArray[1].components(separatedBy: stringSeparater)
                            
                            if newContentArray.count > 1 {
                                message = newContentArray[0].replacingOccurrences(of: "&deg;", with: "°" )
                                
                                print(message)
                                
                            }
                            
                            
                        }
                        
                    }
                }
            }
            if message == "" {
                message = "the weather there couln't be found. Please try again."
            }
            DispatchQueue.main.sync(execute: {
                self.resultLabel.text = message
                
                
            })
            
        }
            task.resume()
        }
        else{
            resultLabel.text="he weather there couln't be found. Please try again."
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


//
//  ViewController.swift
//  Downloading images from the web
//
//  Created by arjun gupta on 05/03/17.
//  Copyright © 2017 arjun gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var bachImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)
        //print(documentsPath)
        
        if documentsPath.count > 0 {
            if let documentsDirectory = documentsPath[0] as? String{
                let restorePath = documentsDirectory + "/bach.jpg"
                bachImageView.image = UIImage(contentsOfFile: restorePath)
                
                
            }
        }
        
        
        /*let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Johann_Sebastian_Bach.jpg/260px-Johann_Sebastian_Bach.jpg")!
        let request = NSMutableURLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request as URLRequest){
            data, response, error in
            if error != nil{
                print(error!)
            }
            else{
                if let data = data {
                    if let bachImage = UIImage(data: data){
                        self.bachImageView.image = bachImage
                        
                        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)
                        if documentsPath.count > 0 {
                            if let documentsDirectory = documentsPath[0] as? String{
                                let savePath = documentsDirectory + "/bach.jpg"
                                do {
                                    try UIImageJPEGRepresentation(bachImage, 1)?.write(to: URL(fileURLWithPath: savePath))
                                }
                                catch{
                                    //process  error
                                }
                                
                            }
                        }
                        
                    }
                }
            }
        }
        task.resume()
 */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


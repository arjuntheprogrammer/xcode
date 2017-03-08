//
//  UsersDetailViewController.swift
//  ParseStarterProject-Swift
//
//  Created by arjun gupta on 08/03/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit
import Parse


class UsersDetailViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var userImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var errorLabel: UILabel!
    @IBAction func updatePorfileImage(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePicker.allowsEditing = false
        
        self.present(imagePicker, animated: true, completion:nil)
        
        
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage{
            userImage.image = image
            
        }
        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var genderSwitch: UISwitch!
    @IBOutlet weak var interestedInSwitch: UISwitch!
    
    @IBAction func update(_ sender: Any) {
        //print(genderSwitch.isOn)
        PFUser.current()?["isFemale"] = genderSwitch.isOn
        PFUser.current()?["isInterestedInWomen"] = interestedInSwitch.isOn
        
        let imageData = UIImagePNGRepresentation(userImage.image!)
        PFUser.current()?["photo"] = PFFile(name: "profile.png", data: imageData!)
        
        PFUser.current()?.saveInBackground(block: { (success, error) in
            if error != nil{
                var errorMessage = "Update failed, try again!"
                let error = error as NSError?
                
                if let parseError = error?.userInfo["error"] as? String{
                    errorMessage = parseError
                    
                }
                self.errorLabel.text = errorMessage
                
                print(error!)
                
            }
            else{
                print("Updated")
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

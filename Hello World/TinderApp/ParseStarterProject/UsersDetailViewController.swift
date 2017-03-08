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
        
        if let isFemale = PFUser.current()?["isFemale"]{
            genderSwitch.setOn(isFemale as! Bool, animated: false)
            
        }
        if let isInterestedInWomen = PFUser.current()?["isInterestedInWomen"]{
            interestedInSwitch.setOn(isInterestedInWomen as! Bool, animated: false)
            
        }
        if let photo = PFUser.current()?["photo"] as? PFFile{
            photo.getDataInBackground(block: { (data, error) in
                if let imageData = data{
                    if let downloadedImage = UIImage(data: imageData){
                        self.userImage.image = downloadedImage
                        
                    }
                }
            })
        }
        
//        
//        let urlArray = ["http://magicdisneyheros.altervista.org/images/midl/97.jpg", "http://images4.wikia.nocookie.net/__cb20121226232915/disney/images/thumb/e/e0/Pocahontascape.jpg/500px-Pocahontascape.jpg", "https://image.freepik.com/free-vector/woman-cartoon-character_23-2147502478.jpg", "https://img.clipartfox.com/b9ec80b7b3a3e7d97624f102dca557d4_-black-female-cartoon-african-american-cartoon-characters-female_300-265.png", "https://s-media-cache-ak0.pinimg.com/564x/78/97/3f/78973f7e1799871436f21f96af125b2e.jpg", "https://s-media-cache-ak0.pinimg.com/736x/9c/5e/86/9c5e86be6bf91c9dea7bac0ab473baa4.jpg", "https://qph.ec.quoracdn.net/main-qimg-52d6d1667deec55833f5308de7031fc3-c"]
//        var count = 0
//        
//        for urlString in urlArray{
//            count += 1
//            
//            let url = URL(string: urlString)!
//            do{
//                let data = try Data(contentsOf: url)
//                let imageFile = PFFile(name: "user"+String(count)+".png", data: data)
//                
//                let user = PFUser()
//                user["photo"] = imageFile
//                user["username"] = "user"+String(count)
//                user["password"] = "password"
//                user["isInterestedInWomen"] = false
//                user["isFemale"] = true
//
//                let acl = PFACL()
//                acl.getPublicWriteAccess = true
//                user.acl = acl
//                
//
//                user.signUpInBackground(block: { (success, error) in
//                    if success{
//                        print("user signed up!")
//                    }
//                })
//
//
//            }
//            catch{
//                print("could not getr data")
//                
//            }
//        }
        
        
        
    
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
                self.performSegue(withIdentifier: "showSwipingViewController", sender: self)
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

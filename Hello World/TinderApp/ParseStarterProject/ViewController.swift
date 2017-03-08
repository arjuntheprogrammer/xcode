/**
* Copyright (c) 2015-present, Parse, LLC.
* All rights reserved.
*
* This source code is licensed under the BSD-style license found in the
* LICENSE file in the root directory of this source tree. An additional grant
* of patent rights can be found in the PATENTS file in the same directory.
*/

import UIKit
import Parse

class ViewController: UIViewController {

    var signMode = true
    
    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var signupOrLoginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBAction func signUpOrLogin(_ sender: Any) {
        if signMode{
            let user = PFUser()
            user.username = usernameField.text
            user.password = passwordField.text
            user.signUpInBackground { (succedd, error) in
                if error != nil{
                    var errorMessage = "SignUp failed, try again!"
                    let error = error as NSError?
                    
                    if let parseError = error?.userInfo["error"] as? String{
                        errorMessage = parseError
                        
                    }
                    self.errorLabel.text = errorMessage
                    
                    print(error!)
                    
                }
                else{
                    print("Signed Up!!")
                }
                
            }
        }
        else{
            PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!, block: { (user, error) in
                if error != nil{
                    var errorMessage = "SignUp failed, try again!"
                    let error = error as NSError?
                    
                    if let parseError = error?.userInfo["error"] as? String{
                        errorMessage = parseError
                        
                    }
                    self.errorLabel.text = errorMessage
                    
                    print(error!)
                    
                }
                else{
                    print("Logged In!!")
                }
                
            })
        }
        
    }
    
    @IBOutlet weak var changeSignupmodeButton: UIButton!
    
    @IBAction func changeSignUpMode(_ sender: Any) {
        if signMode{
            signMode = false
            signupOrLoginButton.setTitle("Log In", for: [])
            changeSignupmodeButton.setTitle("Sign Up", for: [])
            
        }
        else{
            signMode = true
            signupOrLoginButton.setTitle("Sign Up", for: [])
            changeSignupmodeButton.setTitle("Log In", for: [])
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let testObject = PFObject(className: "TestObject2")
        
        testObject["foo"] = "bar"
        
        testObject.saveInBackground { (success, error) -> Void in
            
            // added test for success 11th July 2016
            
            if success {
                
                print("Object has been saved.")
                
            } else {
                
                if error != nil {
                    
                    print (error)
                    
                } else {
                    
                    print ("Error")
                }
                
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

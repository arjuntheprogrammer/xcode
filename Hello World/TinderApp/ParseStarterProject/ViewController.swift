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
            
            let acl = PFACL()
            acl.getPublicWriteAccess = true
            user.acl = acl
            
            
            
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
                    self.performSegue(withIdentifier: "goToUserInfo", sender: self)
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
                    self.redirectUser()
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
        
        
        
        
    }

    override func viewDidAppear(_ animated: Bool) {
       redirectUser()
    }
    func redirectUser(){
        if PFUser.current() != nil{
            
            if PFUser.current()?["isFemale"] != nil && PFUser.current()?["isInterestedInWomen"] != nil && PFUser.current()?["photo"] != nil {
                
                performSegue(withIdentifier: "swipeFromInitialSegue", sender: self)
            }
                
            else{
                performSegue(withIdentifier: "goToUserInfo", sender: self)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

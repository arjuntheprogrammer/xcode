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

    var signupMode = true
    var activityIndicator = UIActivityIndicatorView()
    
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    func createAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            self.dismiss(animated: true, completion: nil)
        }) )
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if PFUser.current() != nil{
            performSegue(withIdentifier: "showUserTable", sender: self)

        }
        self.navigationController?.navigationBar.isHidden = true

    }
    
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet weak var signupOrLogin: UIButton!
    
    @IBAction func SignuporLogin(_ sender: Any) {
        //print(signupMode)
        
        if emailTextField.text == "" || passwordTextField.text == ""{
            createAlert(title: "Error in form", message: "Enter an username and password")
        }
        else{

            
            
            activityIndicator = UIActivityIndicatorView(frame: CGRect(x: 0, y:0, width: 50, height: 50))
            activityIndicator.center = self.view.center
            activityIndicator.hidesWhenStopped = true
            activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
            
            view.addSubview(activityIndicator)
            
            activityIndicator.startAnimating()
            
            
            
            UIApplication.shared.beginIgnoringInteractionEvents()
                
                
                
            if signupMode{
                //signUp mode 
                let user = PFUser()
                user.username = emailTextField.text
                user.email = emailTextField.text
                user.password = passwordTextField.text
                user.signUpInBackground(block: { (success, error) in
                    
                    self.activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                    
                    if error != nil{
                        let error = error as NSError?
                        
                        var displayErrorMessage = "Please try again later."
                        print("here", error)
                        if let errorMessage = error?.userInfo["error"] as? String{
                            displayErrorMessage = errorMessage
                        }
                        self.createAlert(title: "Signup Error", message: displayErrorMessage)
                        
                        
                    }
                    else{
                        print("user signed up")
                        
                        self.performSegue(withIdentifier: "showUserTable", sender: self)

                        
                        
                    }
                })
            }
            else{
                //logIn mode
                PFUser.logInWithUsername(inBackground: emailTextField.text!, password: passwordTextField.text!, block: { (user, error) in
                   self.activityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                    if error != nil{
                        let error = error as NSError?
                        
                        var displayErrorMessage = "Please try again later."
                        print("here", error)
                        if let errorMessage = error?.userInfo["error"] as? String{
                            displayErrorMessage = errorMessage
                        }
                        self.createAlert(title: "Signup Error", message: displayErrorMessage)

                        
                    }
                    else{
                        print("Logged in")
                        self.performSegue(withIdentifier: "showUserTable", sender: self)

                    }
                })
            }
        }
        
    }
    
    @IBOutlet weak var changedSignupButton: UIButton!
    
    @IBAction func changedSignupMode(_ sender: Any) {
       
        if signupMode{
            //change to login mode
            signupOrLogin.setTitle("Log In", for: [])
            
            changedSignupButton.setTitle("Sign Up", for: [])
            
            messageLabel.text = "Dont have an account?"
            signupMode = false
        }
        
        else{
            
                //change to login mode
                signupOrLogin.setTitle("Sign up", for: [])
                
                changedSignupButton.setTitle("Log in", for: [])
                
                messageLabel.text = "Already have an account?"
                signupMode = true
            }
        }
    



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

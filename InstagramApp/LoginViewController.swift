//
//  LoginViewController.swift
//  InstagramApp
//
//  Created by Shirley Plotnik on 3/3/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tabBarItem.title = "Shirley"
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        // Do any additional setup after loading the view.
        if PFUser.currentUser() != nil {
            // if there is a logged in user then load the home view controller
            self.showTabBar()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
    @IBAction func onSignIn(sender: AnyObject) {
        PFUser.logInWithUsernameInBackground(usernameField.text!, password: passwordField.text!) {
            (user: PFUser?, error: NSError?) -> Void in
            if user != nil{
                print("You're logged in")
                self.showTabBar()
            } else {
                print(error!.localizedDescription)
            }
        }
        
    }

    @IBAction func onSignUp(sender: AnyObject) {

       
            let newUser = PFUser()
        
        newUser.username = usernameField.text
        newUser.password = passwordField.text
            
        
        newUser.signUpInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            
            
            if success {
                print("Created User")
                
                self.showTabBar()
            } else {
                print(error?.localizedDescription)
                if(error?.code == 202){
                    print("Username already taken")//we can do more stuff with this later on
                
                }
                
            }
            
        }
    }
    
    func showTabBar(){
        let appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        appdelegate.window?.rootViewController = appdelegate.tabBarController
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


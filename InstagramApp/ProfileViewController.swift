//
//  ProfileViewController.swift
//  InstagramApp
//
//  Created by Shirley Plotnik on 3/5/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutPressed(sender: AnyObject) {
        PFUser.logOut()
        let appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appdelegate.window?.rootViewController = appdelegate.loginViewController
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

//
//  AppDelegate.swift
//  InstagramApp
//
//  Created by Shirley Plotnik on 3/3/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var storyboard: UIStoryboard?
    var tabBarController : UITabBarController?
    var loginViewController: UIViewController?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        //Parse.enableLocalDatastore()
        
        //Parse.setApplicationId("Instagram", clientKey: "djkhgdfgjdfklgjdfkgjfdkgj")
        
        Parse.initializeWithConfiguration(
        ParseClientConfiguration(block: { (configuration:ParseMutableClientConfiguration) -> Void in
            configuration.applicationId = "Instagram"
            configuration.clientKey = "djkhgdfgjdfklgjdfkgjfdkgj"
            configuration.server = "https://secure-reef-42635.herokuapp.com/parse"}))
            
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        
        let profileViewController = storyboard!.instantiateViewControllerWithIdentifier("ProfileViewController")
        profileViewController.tabBarItem.title = "Me"
        profileViewController.tabBarItem.image = UIImage(named: "profile")
        
        let photosViewController = storyboard!.instantiateViewControllerWithIdentifier("PhotosViewController")
        photosViewController.tabBarItem.title = "Home"
        photosViewController.tabBarItem.image = UIImage(named: "home")
        
        let postingViewController = storyboard!.instantiateViewControllerWithIdentifier("PostingViewController")
        postingViewController.tabBarItem.title = "Capture"
        postingViewController.tabBarItem.image = UIImage(named: "capture")
        
        self.tabBarController = UITabBarController()
        self.tabBarController!.viewControllers = [photosViewController, postingViewController, profileViewController]
        self.tabBarController!.selectedIndex = 2 
        
        let loginViewController = storyboard!.instantiateViewControllerWithIdentifier("LoginViewController")
        self.loginViewController = loginViewController
        
        window?.rootViewController = loginViewController
        window?.makeKeyAndVisible()
        
        return true
    }
        
       /* if PFUser.currentUser() != nil {
            print("persist login for " + (PFUser.currentUser()?.username)!)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("LoginViewController") as! UIViewController
            self.window?.rootViewController? = vc
                self.window?.makeKeyAndVisible()
        
        
            ParseClientConfiguration(block: { (configuration:ParseMutableClientConfiguration) -> Void in
                configuration.applicationId = "Instagram"
                configuration.clientKey = "djkhgdfgjdfklgjdfkgjfdkgj"
                configuration.server = "https://secure-reef-42635.herokuapp.com/parse"
            })
        
        return true
    }*/

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


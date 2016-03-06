//
//  PostingViewController.swift
//  InstagramApp
//
//  Created by Shirley Plotnik on 3/5/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import Parse

class PostingViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var captionTextField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
   
    var imageSelected: UIImage?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.submitButton.enabled = false
    }

    @IBAction func submitButtonPressed(sender: AnyObject) {
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func photoPressed(sender: UITapGestureRecognizer) {
        let vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        self.imageSelected = info[UIImagePickerControllerOriginalImage] as? UIImage
        if(imageSelected != nil){
            self.photoImageView.image = imageSelected
        }
        self.submitButton.enabled = true
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    @IBAction func submitPressed(sender: AnyObject) {
        
        var caption = captionTextField.text
        if(caption == nil){
            caption = ""
        }
        UserMedia.postUserImage(imageSelected, withCaption: caption, withUsername: PFUser.currentUser()?.username) { (success : Bool, error: NSError?) -> Void in
            if(success){
                //Lets just go to the other view controller
                self.tabBarController?.selectedIndex = 0
            }
            if(error != nil){
                print(error?.localizedDescription)
            }
        }

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

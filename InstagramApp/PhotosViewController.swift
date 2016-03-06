//
//  PhotosViewController.swift
//  InstagramApp
//
//  Created by Shirley Plotnik on 3/3/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit
import Parse

class PhotosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var PhotosTableView: UITableView!
    
    var images: [PFObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.PhotosTableView.delegate = self
        self.PhotosTableView.dataSource = self
        
        self.PhotosTableView.rowHeight = UITableViewAutomaticDimension
        self.PhotosTableView.estimatedRowHeight = 200}
        
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.queryParse()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func queryParse(){
        let query = PFQuery(className: "UserMedia")
        query.orderByDescending("createdAt")
        query.includeKey("author")
        query.limit = 20
        
        // fetch data asynchronously
        query.findObjectsInBackgroundWithBlock { (media: [PFObject]?, error: NSError?) -> Void in
            if let media = media {
                // do something with the data fetched
                self.images = media
                self.PhotosTableView.reloadData()
            } else {
                // handle error
                print(error?.localizedDescription)
            }
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if(self.images == nil){
            return 0
        }
        return (self.images?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = PhotosTableView.dequeueReusableCellWithIdentifier("PhotoCell") as! PhotoCell
    let image = images![indexPath.row] as PFObject
    
    let file = image["image"] as! PFFile
    file.getDataInBackgroundWithBlock { (data: NSData?, error: NSError?) -> Void in
    if let data = data where error == nil{
				cell.instagramImageView.image = UIImage(data: data)
    }
    }
    cell.captionLabel.text = image["caption"] as? String
    
    return cell
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
//
//  PhotoCell.swift
//  InstagramApp
//
//  Created by Shirley Plotnik on 3/3/16.
//  Copyright © 2016 codepath. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {

    @IBOutlet weak var instagramImageView: UIImageView!
    
    @IBOutlet weak var captionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

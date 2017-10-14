//
//  PostCell.swift
//  MyHood
//
//  Created by Felipe Montoya on 10/10/17.
//  Copyright © 2017 Felipe Montoya. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        postImage.layer.cornerRadius = 15
    }
    
    
    func configureCell (with post: Post){
        titleLabel.text = post.title
        descriptionLabel.text = post.postDescription
        postImage.image = DataService.instance.imageForPath(path: post.imagePath)
    }


}

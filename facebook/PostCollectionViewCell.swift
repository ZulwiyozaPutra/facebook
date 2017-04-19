//
//  PostCollectionViewCell.swift
//  facebook
//
//  Created by Zulwiyoza Putra on 4/18/17.
//  Copyright © 2017 Zulwiyoza Putra. All rights reserved.
//

import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    var post: Post? {
        didSet {
            guard let post = post else {
                print("No post set")
                return
            }
            
            userFullNameLabel.text = post.user.fullName
            postContentLabel.text = post.content
        }
    }

    @IBOutlet weak var userFullNameLabel: UILabel!
    
    @IBOutlet weak var postContentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = UIColor.white
    }

}

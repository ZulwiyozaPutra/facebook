//
//  PostCollectionViewCell.swift
//  facebook
//
//  Created by Zulwiyoza Putra on 4/18/17.
//  Copyright © 2017 Zulwiyoza Putra. All rights reserved.
//

import UIKit

var imageCache = NSCache<AnyObject, AnyObject>()

class PostCollectionViewCell: UICollectionViewCell {
    
    var post: Post? {
        didSet {
            guard let post = post else {
                print("No post set")
                return
            }
            
            userFullNameLabel.text = post.user.fullName
            postContentLabel.text = post.content
            
            if let imageStringURL = post.imageURL {
                if let image = imageCache.object(forKey: imageStringURL as AnyObject) as? UIImage {
                    postContentImageView.image = image
                } else {
                    guard let imageURL = URL(string: imageStringURL) else {
                        print("Can't convert string to url")
                        return
                    }
                    
                    URLSession.shared.dataTask(with: imageURL, completionHandler: { (data, response, error) in
                        guard (error == nil) else {
                            print("There was an error returned")
                            return
                        }
                        
                        guard let imageData = data else {
                            print("There was no data returned")
                            return
                        }
                        
                        guard let image = UIImage(data: imageData) else {
                            print("There was no image data in returned data")
                            return
                        }
                        
                        imageCache.setObject(image, forKey: imageStringURL as AnyObject)
                        
                        DispatchQueue.main.async {
                            self.postContentImageView.image = image
                        }
                        
                    }).resume()
                }
            }
        }
    }

    @IBOutlet weak var userFullNameLabel: UILabel!
    
    @IBOutlet weak var postContentLabel: UILabel!
    
    @IBOutlet weak var postContentImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundColor = UIColor.white
    }

}

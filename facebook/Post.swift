//
//  Post.swift
//  facebook
//
//  Created by Zulwiyoza Putra on 4/18/17.
//  Copyright © 2017 Zulwiyoza Putra. All rights reserved.
//

import UIKit

class Post: NSObject {
    var identifier: String!
    var user: User!
    var content: String?
    var image: UIImage?
    var imageURL: String?
    var modificationDate: Date?
}

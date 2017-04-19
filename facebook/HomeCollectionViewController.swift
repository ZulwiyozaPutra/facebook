//
//  HomeCollectionViewController.swift
//  facebook
//
//  Created by Zulwiyoza Putra on 4/18/17.
//  Copyright © 2017 Zulwiyoza Putra. All rights reserved.
//

import UIKit

let cellIdentifier = "Cell"
var posts = [Post]()

class HomeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureUIView()
        setupPosts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! PostCollectionViewCell
        cell.post = posts[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var contentTextHeight = CGFloat()
        
        if let contentText = posts[indexPath.item].content {
            let spaceBound = CGSize(width: view.frame.width, height: 134)
            let drawingOption = NSStringDrawingOptions.usesFontLeading.union(NSStringDrawingOptions.usesLineFragmentOrigin)
            let spaceForContent = NSString(string: contentText).boundingRect(with: spaceBound, options: drawingOption, attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 14)], context: nil)
            contentTextHeight = spaceForContent.height
        }
        
        let topAndBottomSpace: CGFloat = 24
        let header: CGFloat = 40
        let contentImageHeight = view.frame.width / 4 * 3
        let content: CGFloat = contentTextHeight + contentImageHeight
        let counter: CGFloat = 16
        let divider: CGFloat = 0.5
        let footer: CGFloat = 32
        let spacesBetween: CGFloat = 40
        let cellHeight = topAndBottomSpace + header + content + counter + divider + footer + spacesBetween
        
        return CGSize(width: view.frame.width, height: cellHeight)
    }
    
    func setupPosts() -> Void {
        let firstPost = Post()
        let firstUser = User()
        firstUser.fullName = "Steve Jobs"
        firstUser.identifier = "1G4J59S31NFH"
        firstPost.user = firstUser

        firstPost.content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In in nisl venenatis, sagittis dolor sed, accumsan risus. Donec eu dapibus diam. In molestie."
        posts.append(firstPost)
        
        let secondPost = Post()
        let secondUser = User()
        secondUser.fullName = "Bill Gates"
        secondUser.identifier = "1G4759S31NFH"
        secondPost.user = secondUser
        
        secondPost.content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vitae massa quam. Nam sit amet enim et lorem lobortis ultrices consequat a ipsum. Praesent dolor felis, laoreet."
        posts.append(secondPost)
        
        let thirdPost = Post()
        let thirdUser = User()
        thirdUser.fullName = "Elon Musk"
        thirdUser.identifier = "1G7759S31NFH"
        thirdPost.user = thirdUser
        
        thirdPost.content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin pellentesque vestibulum turpis porttitor hendrerit. Aliquam vitae nisi placerat."
        posts.append(thirdPost)
        
        let fourthPost = Post()
        let fourthUser = User()
        fourthUser.fullName = "Mark Zuckerberg"
        fourthUser.identifier = "1G7759S41NFH"
        fourthPost.user = fourthUser
        
        fourthPost.content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur molestie est a aliquam consequat. Suspendisse potenti. Donec nec orci sapien. Praesent congue convallis quam in bibendum. Ut pretium rutrum erat. Phasellus augue."
        posts.append(fourthPost)

        let fifthPost = Post()
        let fifthUser = User()
        fifthUser.fullName = "Jack Dorsey"
        fifthUser.identifier = "1G7759S41NFJ"
        fifthPost.user = fifthUser
        
        fifthPost.content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce eu semper ex. Donec ultricies neque eu sem aliquam iaculis. Nullam ut turpis bibendum, aliquet ante a, accumsan lorem. Vestibulum ultricies quis purus at elementum. Aliquam ut tincidunt turpis. Vivamus tempor aliquet venenatis. Etiam ut varius dui, nec cursus diam. Maecenas blandit nisi eget fringilla consectetur. Nam finibus est efficitur, lobortis sem sit amet, pharetra."
        posts.append(fifthPost)
        
        collectionView?.reloadData()
    }
    
    func configureUIView() -> Void {
        
        // Unwrap collection view
        guard let collectionView = self.collectionView else {
            print("Collection View is nil")
            return
        }
        
        // Register the nib for identifier
        let nib = UINib(nibName: "PostCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
        
        // Set backgorund color
        collectionView.backgroundColor = UIColor(white: 0.95, alpha: 1.00)
    }

}


//
//  HomeCollectionViewController.swift
//  facebook
//
//  Created by Zulwiyoza Putra on 4/18/17.
//  Copyright © 2017 Zulwiyoza Putra. All rights reserved.
//

import UIKit

let cellIdentifier = "Cell"
let posts = [Post]()

class HomeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureUIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let topAndBottomSpace: CGFloat = 24
        let header: CGFloat = 40
        let imageHeight = view.frame.width / 4 * 3
        let content: CGFloat = 143.5 + imageHeight
        let counter: CGFloat = 16
        let divider: CGFloat = 0.5
        let footer: CGFloat = 32
        let spacesBetween: CGFloat = 40
        let cellHeight = topAndBottomSpace + header + content + counter + divider + footer + spacesBetween
        
        return CGSize(width: view.frame.width, height: cellHeight)
    }
    
    func setupPosts() -> Void {
        let firstPost = Post()
        firstPost.user.username = "Steve"
        firstPost.content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In in nisl venenatis, sagittis dolor sed, accumsan risus. Donec eu dapibus diam. In molestie."
        
        let secondPost = Post()
        secondPost.user.username = "Bill"
        secondPost.content = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vitae massa quam. Nam sit amet enim et lorem lobortis ultrices consequat a ipsum. Praesent dolor felis, laoreet."
        
        let thirdPost = Post()
        
        
        
    }
    
    func configureUIView() -> Void {
        
        // Unwrap collection view
        guard let collectionView = self.collectionView else {
            print("Collection View is nil")
            return
        }
        
        // Register the nib for identifier
        let nib = UINib(nibName: "HomeCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
        
        // Set backgorund color
        collectionView.backgroundColor = UIColor(white: 0.95, alpha: 1.00)
    }

}


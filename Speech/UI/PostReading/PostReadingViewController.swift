//
//  PostReadingViewController.swift
//  Speech
//
//  Created by flav on 27/10/2018.
//  Copyright © 2018 flav. All rights reserved.
//

import UIKit
import FirebaseFirestore

class PostReadingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let presenter = PostReadingPresenter(service: PostService(dataBase: Firestore.firestore()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(self)
        presenter.viewDidLoad()
    }
}

extension PostReadingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.nbOfPosts
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PostCollectionViewCell = collectionView.dequeueReusableCell(indexPath: indexPath)
        presenter.configureCell(cell: cell, index: indexPath.item)
        return cell
    }
}

extension PostReadingViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        //+ Offset
        if (scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)) {
            //print("load Once")
        }
    }
}

extension PostReadingViewController: PostReadingDisplayer {
   internal func setupUI() {
        collectionView.registerReusableCell(PostCollectionViewCell.self)
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.estimatedItemSize = CGSize(width: collectionView.frame.width - 40, height: 1.0)
        flowLayout.minimumLineSpacing = 20.0
        collectionView.collectionViewLayout = flowLayout
    }
    
    internal func reloadData() {
        collectionView.reloadData()
    }
}

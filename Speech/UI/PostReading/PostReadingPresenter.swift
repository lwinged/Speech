//
//  PostReadingPresenter.swift
//  Speech
//
//  Created by flav on 27/10/2018.
//  Copyright © 2018 flav. All rights reserved.
//

import Foundation

protocol PostCellDisplayer: class {
    func setup(message: String)
}

protocol PostReadingDisplayer: class {
    func reloadData()
    func setupUI()
}

class PostReadingPresenter: BasePresenter {
    typealias Displayer = PostReadingDisplayer
    
    fileprivate let postService: PostService
    internal weak var displayer: Displayer?
    fileprivate var posts: [PostModel]
    
    var nbOfPosts: Int { return posts.count }
    
    init(service: PostService) {
        postService = service
        posts = []
    }
    
    fileprivate func getPostList() {
        postService.getList { [weak self] (list, err) in
            guard let strongSelf = self, let list = list, err == nil else {return}
            strongSelf.posts += list
            strongSelf.displayer?.reloadData()
        }
    }
    
    func viewDidLoad() {
        displayer?.setupUI()
        getPostList()
    }
    
    func configureCell(cell: PostCellDisplayer, index: Int) {
        cell.setup(message: posts[index].message)
    }
    
    func attachView(_ viewProtocol: Displayer) {
        displayer = viewProtocol
    }
    
    func detachView() {
        displayer = nil
    }
}

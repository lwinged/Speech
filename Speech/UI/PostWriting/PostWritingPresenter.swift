//
//  PostWritingPresenter.swift
//  Speech
//
//  Created by flav on 27/10/2018.
//  Copyright © 2018 flav. All rights reserved.
//

import Foundation

protocol PostWritingDisplayer: class {
    func onCreatePostSuccess()
    func onCreatePostError()
}

class PostWritingPresenter: BasePresenter {
    
    typealias Displayer = PostWritingDisplayer
    internal weak var displayer: Displayer?
    
    fileprivate let postService: PostService
    fileprivate var posts: [PostModel]
    
    init(service: PostService) {
        postService = service
        posts = []
    }
    
    func createPost(message: String, author: String, ref: String) {
        let post = PostModel(message: message, author: author, ref: ref)
        
        postService.create(post: post) { [weak self] (_, err) in
            guard let strongSelf = self, err == nil else {
                self?.displayer?.onCreatePostError()
                return
            }
            strongSelf.displayer?.onCreatePostSuccess()
        }
    }
    
    func viewDidLoad() {
    }
    
    func attachView(_ viewProtocol: Displayer) {
        displayer = viewProtocol
    }
    
    func detachView() {
        displayer = nil
    }
}

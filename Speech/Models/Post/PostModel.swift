//
//  PostModel.swift
//  Speech
//
//  Created by flav on 27/10/2018.
//  Copyright © 2018 flav. All rights reserved.
//

import Foundation

struct PostModel {
    let id: String
    let message: String
    let authorName: String
    let reference: String
    let reportsCount: UInt
    let likesCount: UInt
    let isVisible: Bool
    
    init(post: Post) {
        id = post.id
        message = post.message
        authorName = post.authorName
        reference = post.reference
        reportsCount = post.reportsCount
        likesCount = post.likesCount
        isVisible = true
    }
    
    init(message: String, author: String, ref: String) {
        id = ""
        self.message = message
        authorName = author
        reference = ref
        reportsCount = 0
        likesCount = 0
        isVisible = true
    }
    
    func toPost() -> Post {
        return Post(id: id, message: message, author: authorName, ref: reference)
    }
}

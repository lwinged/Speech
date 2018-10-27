//
//  Post.swift
//  Speech
//
//  Created by flav on 27/10/2018.
//  Copyright © 2018 flav. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct Post {
    
    fileprivate static let messageKey = "message"
    fileprivate static let authorKey = "authorName"
    fileprivate static let referenceKey = "reference"
    fileprivate static let reportsCountKey = "reportsCount"
    fileprivate static let likesCountKey = "likesCount"
    fileprivate static let isVisibleKey = "isVisible"
    
    let id: String
    let message: String
    let authorName: String
    let reference: String
    let reportsCount: UInt
    let likesCount: UInt
    let isVisible: Bool
    //let category: String
    //let lang: String
    //let createdAt: Date
    
    init(document: QueryDocumentSnapshot) {
        id = document.documentID
        let data = document.data()
        message = data[Post.messageKey] as? String ?? ""
        authorName = data[Post.authorKey] as? String ?? ""
        reference = data[Post.referenceKey] as? String ?? ""
        reportsCount = data[Post.reportsCountKey] as? UInt ?? 0
        likesCount = data[Post.likesCountKey] as? UInt ?? 0
        isVisible = data[Post.isVisibleKey] as? Bool ?? true
    }
    
    init(id: String, message: String, author: String, ref: String) {
        self.id = id
        self.message = message
        authorName = author
        reference = ref
        reportsCount = 0
        likesCount = 0
        isVisible = true
    }
    
    func toData() -> [String: Any] {
        return [
            Post.messageKey: message,
            Post.authorKey: authorName,
            Post.referenceKey: reference,
            Post.reportsCountKey: reportsCount,
            Post.likesCountKey: likesCount,
            Post.isVisibleKey: isVisible,
        ]
    }
}

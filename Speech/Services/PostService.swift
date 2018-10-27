//
//  PostService.swift
//  Speech
//
//  Created by flav on 27/10/2018.
//  Copyright © 2018 flav. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct PostService {
    fileprivate static let collectionKey = "posts"
    
    let db: Firestore
    
    init(dataBase: Firestore) {
        db = dataBase
    }
    
    func getList(completion: @escaping ([PostModel]?, Error?) -> Void) {
        db.collection(PostService.collectionKey).limit(to: 10).getDocuments { (querySnapshot, err) in
            guard let querySnapshot = querySnapshot, err == nil else {
                completion(nil, err)
                return
            }
            
            let posts = querySnapshot.documents.map { PostModel(post: Post(document: $0)) }
            completion(posts, nil)
        }
    }
    
    func create(post: PostModel, completion: @escaping (String?, Error?) -> Void) {
        var ref: DocumentReference? = nil
        ref = db.collection(PostService.collectionKey).addDocument(data: post.toPost().toData()) { err in
            guard let docId = ref?.documentID, err == nil else {
                completion(nil, err)
                return
            }
            completion(docId, nil)
        }
    }
    
    func addLike(post: PostModel) {
        //cloud function ?
    }
    
    func addReport(post: PostModel) {
        //cloud function ?
    }
}

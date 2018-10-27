//
//  PostWritingViewController.swift
//  Speech
//
//  Created by flav on 27/10/2018.
//  Copyright © 2018 flav. All rights reserved.
//

import UIKit
import FirebaseFirestore

class PostWritingViewController: UIViewController {
    
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var authorTextField: UITextField!
    @IBOutlet weak var referenceTextField: UITextField!
    
    fileprivate let presenter = PostWritingPresenter(service: PostService(dataBase: Firestore.firestore()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(self)
    }
    
    @IBAction func validationAction(_ sender: Any) {
        presenter.createPost(message: messageTextView.text,
                             author: authorTextField.text.orEmpty,
                             ref: referenceTextField.text.orEmpty)
    }
}

extension PostWritingViewController: PostWritingDisplayer {
    func onCreatePostSuccess() {
        print("Document Created")
        messageTextView.text = ""
        authorTextField.text = ""
        referenceTextField.text = ""
    }
    
    func onCreatePostError() {
        print("ERROR Document is not created")
    }
}

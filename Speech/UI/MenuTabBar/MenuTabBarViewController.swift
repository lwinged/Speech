//
//  MenuTabBarViewController.swift
//  Speech
//
//  Created by flav on 27/10/2018.
//  Copyright © 2018 flav. All rights reserved.
//

import UIKit

class MenuTabBarViewController: UITabBarController {

    fileprivate let presenter = MenuTabBarPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(self)
        presenter.viewDidLoad()
    }
}

extension MenuTabBarViewController: MenuTabBarDisplayer {
    
    internal func setupUI() {
        let postReadingVC = PostReadingViewController()
        postReadingVC.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        
        let postWritingVC = PostWritingViewController()
        postWritingVC.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
        viewControllers = [postReadingVC, postWritingVC]
    }
}

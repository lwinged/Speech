//
//  MenuTabBarPresenter.swift
//  Speech
//
//  Created by flav on 27/10/2018.
//  Copyright © 2018 flav. All rights reserved.
//

import Foundation

protocol MenuTabBarDisplayer: class {
    func setupUI()
}

class MenuTabBarPresenter: BasePresenter {
    typealias Displayer = MenuTabBarDisplayer
    internal weak var displayer: Displayer?
    
    func viewDidLoad() {
        displayer?.setupUI()
    }
    
    func attachView(_ viewProtocol: Displayer) {
        displayer = viewProtocol
    }
    
    func detachView() {
        displayer = nil
    }
}

//
//  BasePresenter.swift
//  Speech
//
//  Created by flav on 27/10/2018.
//  Copyright © 2018 flav. All rights reserved.
//

import Foundation

protocol BasePresenter: class {
    associatedtype Displayer
    
    var displayer: Displayer? { get set }
    
    func viewDidLoad()
    
    func attachView(_ viewProtocol: Displayer)
    
    func detachView()
}

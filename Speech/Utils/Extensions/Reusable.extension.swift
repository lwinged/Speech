//
//  Reusable.extension.swift
//  Speech
//
//  Created by flav on 27/10/2018.
//  Copyright © 2018 flav. All rights reserved.
//

import UIKit

protocol Reusable {
    static var nib: UINib? { get }
    static var reuseIdentifier: String { get }
}

extension Reusable {
    static var nib: UINib? {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

//
//  Optional+String.extension.swift
//  Speech
//
//  Created by flav on 27/10/2018.
//  Copyright © 2018 flav. All rights reserved.
//

import Foundation

extension Optional where Wrapped == String {
    var orEmpty: String {
        switch self {
        case .some(let value):
            return value
        case .none:
            return ""
        }
    }
}

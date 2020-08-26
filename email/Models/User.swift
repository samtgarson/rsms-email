//
//  User.swift
//  email
//
//  Created by Sam Garson on 26/08/2020.
//  Copyright © 2020 Sam Garson. All rights reserved.
//

import Foundation

struct User: Hashable {
    var name: String
    var email: String
    
    var shortDescription: String {
        let names = name.split(separator: " ")
        
        return "\(names[0]) \(names[1].prefix(1))"
    }
}

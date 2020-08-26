//
//  Email.swift
//  email
//
//  Created by Sam Garson on 26/08/2020.
//  Copyright © 2020 Sam Garson. All rights reserved.
//

import Foundation

struct Email: Hashable {
    var subject: String
    var body: String
    var receivedAt: Date
    var read: Bool = false
    var from: User
    var copied: [User] = []
    
    var users: [User] {
        copied + [from]
    }
}

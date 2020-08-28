//
//  Email.swift
//  email
//
//  Created by Sam Garson on 26/08/2020.
//  Copyright © 2020 Sam Garson. All rights reserved.
//

import Foundation

struct Email: Hashable, Identifiable {
    internal init(subject: String, body: String, receivedAt: Date, read: Bool = false, from: User, copied: [User] = []) {
        self.subject = subject
        self.body = body
        self.receivedAt = receivedAt
        self.read = read
        self.from = from
        self.copied = copied
        self.id = UUID().uuidString
    }
    
    var id: String
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

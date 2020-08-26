//
//  EmailThread.swift
//  email
//
//  Created by Sam Garson on 26/08/2020.
//  Copyright © 2020 Sam Garson. All rights reserved.
//

import Foundation

struct EmailThread: Hashable {
    var emails: [Email]
    
    var subject: String {
        emails.first?.subject ?? ""
    }
    
    var preview: String {
        emails.last?.body.replacingOccurrences(of: "\n", with: " ") ?? ""
    }
    
    var users: [User] {
        var users = Set(emails.map { $0.from })
        users.remove(currentUser)
        
        return Array(users)
    }
    
    var lastReceived: Date {
        emails.last?.receivedAt ?? Date()
    }
    
    var read: Bool {
        emails.reduce(false) { $0 || $1.read }
    }
    
    var label: String {
        let names = users.map { $0.shortDescription }.joined(separator: ", ")
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        let date = formatter.string(from: lastReceived)
        
        return "\(names) at \(date)"
    }
}

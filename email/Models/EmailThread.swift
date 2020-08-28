//
//  EmailThread.swift
//  email
//
//  Created by Sam Garson on 26/08/2020.
//  Copyright © 2020 Sam Garson. All rights reserved.
//

import Foundation
import SwiftUI

class EmailThread: Identifiable {
    private let userColors: [Color] = [.red, .green, .purple]
    
    internal init(emails: [Email], selected: Bool = false) {
        self.emails = emails
        self.id = UUID().uuidString
        self.selected = selected
    }
    
    var id: String
    var selected: Bool
    
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
        
        return Array(users.sorted(by: { $0.name > $1.name }))
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
    
    func send(_ body: String) {
        emails.append(Email(subject: "Re: \(subject)", body: body, receivedAt: Date(), from: currentUser))
    }
    
    func color(for user: User) -> Color {
        if user == currentUser { return Color.black }
        
        let index = users.firstIndex(of: user) ?? 0
        
        return userColors[index % userColors.count]
    }
}

extension EmailThread: Hashable {
    static func == (lhs: EmailThread, rhs: EmailThread) -> Bool {
        lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}

//
//  EmailView.swift
//  email
//
//  Created by Sam Garson on 26/08/2020.
//  Copyright © 2020 Sam Garson. All rights reserved.
//

import SwiftUI

struct EmailView: View {
    var email: Email
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            meta
            Text(email.body)
                .lineSpacing(5)
                .frame(maxWidth: .infinity, alignment: .leading)
            }.frame(maxWidth: .infinity).padding(.bottom, 50)
    }
    
    private var meta: some View {
        HStack(spacing: 10) {
            Circle().fill(Color.black).frame(width: 10, height: 10)
            HStack(spacing: 0) {
                name
                Text(", ")
                Text(date)
            }.opacity(0.5)
        }
    }
    
    private var name: some View {
        let isMe = email.from == currentUser
        let name = isMe ? "You" : email.from.name
        let weight: Font.Weight = isMe ? .semibold : .regular
        
        return Text(name).fontWeight(weight)
    }
    
    private var date: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE MMM d, h:mma"
        return  formatter.string(from: email.receivedAt)
    }
}

struct EmailView_Previews: PreviewProvider {
    static var previews: some View {
        EmailView(email: EmailService().customThread.emails.first!)
    }
}

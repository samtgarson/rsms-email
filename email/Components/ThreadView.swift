//
//  ThreadViewer.swift
//  email
//
//  Created by Sam Garson on 26/08/2020.
//  Copyright © 2020 Sam Garson. All rights reserved.
//

import SwiftUI

struct ThreadView: View {
    var thread: EmailThread
    
    @State var scrolling = false
    @EnvironmentObject var settings: ViewSettings
    
    var body: some View {
        HStack(alignment: .top) {
            main
            participants
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private var main: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(thread.subject)
                .font(.title)
                .fontWeight(.semibold)
                .padding(.bottom, 30)
                .padding(.top, 10)
            ScrollView {
                ScrollViewReader { sp in
                    ForEach(thread.emails, id: \.self) { EmailView(email: $0, color: thread.color(for: $0.from)) }
                    Divider()
                    ReplyBox() { body in
                        self.thread.send(body)
                    }
                    .id("replyBox")
                    .frame(maxHeight: .infinity)
                    .onReceive(settings.$replyFocused) { focused in
                        if focused { sp.scrollTo("replyBox", anchor: .bottom) }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
    }
    
    private var participants: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Participants").fontWeight(.semibold)
            ForEach(thread.users) { user in
                self.row(for: user)
            }
        }
        .padding(10)
        .opacity(withAnimation {
            settings.replyFocused ? 0.2 : 1
        })
    }
    
    private func row(for user: User) -> some View {
        HStack {
            Circle().fill(thread.color(for: user)).frame(width: 30, height: 30)
            VStack(alignment: .leading, spacing: 3) {
                Text(user.name)
                Text(user.email)
                    .font(.caption)
                    .opacity(0.5)
            }
            Spacer()
        }
        .frame(width: 250)
    }
}

struct ThreadViewer_Previews: PreviewProvider {
    static var previews: some View {
        ThreadView(thread: EmailService().customThread)
    }
}

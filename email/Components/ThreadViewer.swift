//
//  ThreadViewer.swift
//  email
//
//  Created by Sam Garson on 26/08/2020.
//  Copyright © 2020 Sam Garson. All rights reserved.
//

import SwiftUI

struct ThreadViewer: View {
    var thread: EmailThread
    
    @State var scrolling = false
    
    var body: some View {
        HStack(alignment: .top) {
            main
            participants
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
    private var main: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(thread.subject).font(.title).fontWeight(.semibold).padding(.bottom, 50)
            ScrollView {
                ForEach(thread.emails, id: \.self) { EmailView(email: $0) }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 20)
    }
    
    private var participants: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Participants")
            ForEach(thread.users) { user in
                self.row(for: user)
            }
        }.padding(10)
    }
    
    private func row(for user: User) -> some View {
        HStack {
            Circle().fill(Color.black).frame(width: 30, height: 30)
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
        ThreadViewer(thread: EmailService().customThread)
    }
}

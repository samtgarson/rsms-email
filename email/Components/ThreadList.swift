//
//  ThreadList.swift
//  email
//
//  Created by Sam Garson on 26/08/2020.
//  Copyright © 2020 Sam Garson. All rights reserved.
//

import SwiftUI

struct ThreadList: View {
    let threads: [EmailThread] = EmailService().threads
    
    init() {
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                ForEach(threads, id: \.self) { thread in
                    self.row(for: thread)
                }
            }
        }.padding(10)
    }
    
    private func row(for thread: EmailThread) -> some View {
        HStack(alignment: .top) {
            self.icon(for: thread)
                .padding(.vertical, 5)
            self.details(for: thread)
        }
    }
    
    private func icon(for thread: EmailThread) -> some View {
        RoundedRectangle(cornerRadius: 8)
            .fill(Color.blue)
            .frame(width: 8, height: 8)
            .opacity(thread.read ? 0 : 1)
    }
    
    private func details(for thread: EmailThread) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(thread.subject)
            Text(thread.label)
                .opacity(0.5)
                .font(.caption)
            Text(thread.preview)
                .opacity(0.5)
                .font(.caption)
                .truncationMode(.tail)
                .lineLimit(1)
        }
    }
}

struct ThreadList_Previews: PreviewProvider {
    static var previews: some View {
        ThreadList()
    }
}

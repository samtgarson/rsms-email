//
//  ReplyBox.swift
//  email
//
//  Created by Sam Garson on 26/08/2020.
//  Copyright © 2020 Sam Garson. All rights reserved.
//

import SwiftUI

struct ReplyBox: View {
    var handleReply: (_ body: String) -> Void
    @State private var text: String = ""
    
    @EnvironmentObject var settings: ViewSettings

    var body: some View {
        VStack {
            ZStack(alignment: .topLeading) {
                TextEditor(text: $text)
                if text.isEmpty {
                    Text("Reply")
                        .opacity(0.5)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 5)
                }
            }.frame(height: settings.replyFocused ? 300 : 100)
            if settings.replyFocused { actionBar }
        }
        .padding(.vertical)
        .onTapGesture {
            withAnimation {
                self.settings.replyFocused = true
            }
        }
    }
    
    private var actionBar: some View {
        HStack() {
            PrettyButton({
                self.handleReply(self.text)
                self.text = ""
                withAnimation { settings.replyFocused = false }
            }, primary: true) {
                Text("Send ").fontWeight(.semibold).padding(.trailing, 6)
                (
                    Text(Image(systemName: "command")) +
                    Text(Image(systemName: "arrow.turn.down.left"))
                ).font(.footnote).opacity(0.5)
            }
            PrettyButton({}) {
                Text("Add Participant... ").fontWeight(.semibold).padding(.trailing, 6)
                (
                    Text(Image(systemName: "option")).font(.footnote) +
                    Text(Image(systemName: "command")).font(.footnote) +
                    Text("P")
                ).opacity(0.5)
            }
            PrettyButton({}) { Text("‌ ") + Text(Image(systemName: "ellipsis")) + Text("‌ ") }
            Spacer()
            PrettyButton({ withAnimation { settings.replyFocused.toggle() } }) { Text("‌ ") + Text(Image(systemName: "multiply")) + Text("‌ ") }
        }
    }
}

struct ReplyBox_Previews: PreviewProvider {
    
    static var previews: some View {
        Preview()
    }
    
    struct Preview: View {
        var settings = ViewSettings()
        
        var body: some View {
            VStack {
                Button("Toggle") { withAnimation { settings.replyFocused.toggle() } }
                ReplyBox() { body in
                    print(body)
                }.environmentObject(settings)
            }
        }
    }
}

//
//  Sidebar.swift
//  email
//
//  Created by Sam Garson on 26/08/2020.
//  Copyright © 2020 Sam Garson. All rights reserved.
//

import SwiftUI

enum Views: String, CaseIterable, Identifiable {
    case inbox = "Inbox"
    case sent = "Sent"
    
    var id: String { self.rawValue }
}

struct Sidebar: View {
    @State private var selectedView: Views = .inbox
    
    var body: some View {
        VStack {
            ThreadList().frame(maxHeight: .infinity)
            ViewChooser
        }
        .padding(.vertical, 10)
        .padding(.trailing, 10)
    }
    
    private var ViewChooser: some View {
        HStack {
            Text("View: Inbox")
            Spacer()
            Image(systemName: "chevron.up.chevron.down")
        }
        .padding(.vertical, 10)
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.2).cornerRadius(5))
        .padding(.horizontal, 10)
    }
    
    
    /// This is probably what the picker should be, but it looks bad in iOS 13
    private var ProperViewChooser: some View {
        Form {
            Section {
                Picker("View:", selection: $selectedView) {
                    ForEach(Views.allCases, id: \.self) {
                        Text("View: \($0.rawValue)")
                    }
                }.labelsHidden()
            }
        }
    }
}

struct Sidebar_Previews: PreviewProvider {
    static var previews: some View {
        Sidebar()
    }
}

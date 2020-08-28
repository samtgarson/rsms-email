//
//  PrettyButton.swift
//  email
//
//  Created by Sam Garson on 27/08/2020.
//  Copyright © 2020 Sam Garson. All rights reserved.
//

import SwiftUI

struct PrettyButton<Content: View>: View {
    internal init(
        _ action: @escaping () -> Void,
        primary: Bool = false,
        @ViewBuilder _ content: @escaping () -> Content
    ) {
        self.action = action
        self.content = content
        self.primary = primary
    }
    
    var action: () -> Void
    var primary: Bool
    var content: () -> Content
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 0, content: content)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 10)
        .background(backgroundColor.cornerRadius(5))
        .foregroundColor(color)
    }
    
    private var color: Color {
        primary ? Color.white : Color.black
    }
    
    private var backgroundColor: Color {
        primary ? Color.blue : Color.gray.opacity(0.1)
    }
}

struct PrettyButton_Previews: PreviewProvider {
    static var previews: some View {
        PrettyButton({}) { Text("hello") }
    }
}

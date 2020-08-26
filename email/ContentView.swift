//
//  ContentView.swift
//  email
//
//  Created by Sam Garson on 26/08/2020.
//  Copyright © 2020 Sam Garson. All rights reserved.
//

import SwiftUI

let currentUser = User(name: "Robin Hood", email: "robin@gmail.com")

struct ContentView: View {
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .white
    }
 
    var body: some View {
        HStack {
            Sidebar()
                .frame(width: 300)
            DetailView()
                .frame(maxWidth: .infinity)
        }
        
    }
}

struct DetailView: View {
    var body: some View {
        Text("hello")
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        return ContentView()
            .previewLayout(.fixed(width: 1194, height: 834))
    }
}

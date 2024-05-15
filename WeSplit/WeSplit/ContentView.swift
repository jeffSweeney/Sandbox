//
//  ContentView.swift
//  WeSplit
//
//  Created by Jeffrey Sweeney on 5/15/24.
//

import SwiftUI

struct ContentView: View {
    @State private var yourName = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("Hello, world!")
                    TextField("What is your name?", text: $yourName)
                }
                
                Section {
                    if !yourName.isEmpty {
                        Text("Hello, \(yourName)!")
                    }
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}

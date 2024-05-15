//
//  ContentView.swift
//  WeSplit
//
//  Created by Jeffrey Sweeney on 5/15/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Form {
            Section {
                Text("Hello, world! - Section 1 item 1.")
                Text("Hello, world! - Section 1 item 2.")
            }
            
            Section {
                Text("Hello, world! - Section 2 item 1.")
                Text("Hello, world! - Section 2 item 2.")
            }
        }
    }
}

#Preview {
    ContentView()
}

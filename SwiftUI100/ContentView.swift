//
//  ContentView.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/03/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: No1()) {
                    Text("No. 1")
                }
                Text("No. 2")
                Text("No. 3")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

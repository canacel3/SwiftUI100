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
                NavigationLink(destination: No2()) {
                    Text("No. 2")
                }
                NavigationLink(destination: No3()) {
                    Text("No. 3")
                }
                NavigationLink(destination: No4()) {
                    Text("No. 4")
                }
                NavigationLink(destination: No5()) {
                    Text("No. 5")
                }
                NavigationLink(destination: No6()) {
                    Text("No. 6")
                }
                NavigationLink(destination: No7()) {
                    Text("No. 7")
                }
                NavigationLink(destination: No8()) {
                    Text("No. 8")
                }
                NavigationLink(destination: No9()) {
                    Text("No. 9")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

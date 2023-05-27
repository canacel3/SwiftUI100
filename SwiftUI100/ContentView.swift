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
                Section {
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
                    NavigationLink(destination: No10()) {
                        Text("No. 10")
                    }
                } header: {
                    Text("No.1 ~ No.10")
                }
                Section {
                    NavigationLink(destination: No11()) {
                        Text("No. 11")
                    }
                    NavigationLink(destination: No12()) {
                        Text("No. 12")
                    }
                    NavigationLink(destination: No13()) {
                        Text("No. 13")
                    }
                    NavigationLink(destination: No14()) {
                        Text("No. 14")
                    }
                    NavigationLink(destination: No15()) {
                        Text("No. 15")
                    }
                    NavigationLink(destination: No16()) {
                        Text("No. 16")
                    }
                    NavigationLink(destination: No17()) {
                        Text("No. 17")
                    }
                    NavigationLink(destination: No18()) {
                        Text("No. 18")
                    }
                    NavigationLink(destination: No19()) {
                        Text("No. 19")
                    }
                } header: {
                    Text("No.11 ~ No.20")
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

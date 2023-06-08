//
//  No75.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/09.
//

import SwiftUI

struct No75: View {
    @State private var tabSelection: Int = 0
    var body: some View {
        TabView(selection: $tabSelection) {
            No75_2(tabSelection: $tabSelection)
                .tabItem {
                    Image(systemName: "house")
                        .renderingMode(.template)
                    Text("First")
                }
                .tag(0)
            No75_3(tabSelection: $tabSelection)
                .tabItem {
                    Image(systemName: "books.vertical")
                        .renderingMode(.template)
                    Text("Second")
                }
                .tag(1)
        }
    }
}

struct No75_2: View {
    @Binding var tabSelection: Int
    var body: some View {
        VStack {
            Text("First")
            Button("Go to Second") {
                tabSelection = 1
            }
        }
    }
}

struct No75_3: View {
    @Binding var tabSelection: Int
    var body: some View {
        VStack {
            Text("First")
            Button("Go to First") {
                tabSelection = 0
            }
        }
    }
}

struct No75_Previews: PreviewProvider {
    static var previews: some View {
        No75()
    }
}

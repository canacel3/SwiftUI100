//
//  No8.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/04/28.
//

import SwiftUI

struct No8: View {
    var body: some View {
        TabView {
            Text("first tab").tabItem {
                Image(systemName: "1.square.fill")
                Text("first")
            }
            Text("second tab").tabItem {
                Image(systemName: "2.square.fill")
                Text("second")
            }
            Text("thrid tab").tabItem {
                Image(systemName: "3.square.fill")
                Text("third")
            }
        }
    }
}

struct No8_Previews: PreviewProvider {
    static var previews: some View {
        No8()
    }
}

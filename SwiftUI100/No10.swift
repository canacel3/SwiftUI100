//
//  No10.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/05/27.
//

import SwiftUI

struct No10: View {
    var body: some View {
        List {
            Section {
                Text("にんじん")
                Text("トマト")
                Text("大根")
            } header: {
                Text("野菜")
            }
            Section {
                Text("いちご")
                Text("りんご")
                Text("ぶどう")
            } header: {
                Text("果物")
            }
        }
    }
}

struct No10_Previews: PreviewProvider {
    static var previews: some View {
        No10()
    }
}

//
//  No56.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/08.
//

import SwiftUI

struct No56: View {
    @State private var text: String = "aaa"
    var body: some View {
        NavigationStack {
            Text(text)
            NavigationLink(destination: {
                No56_2(text: $text)
            }, label: {
                Text("Change Text")
            }).padding()
        }
    }
}

struct No56_2: View {
    @Binding var text: String
    var body: some View {
        VStack(spacing: 16) {
            Button(action: {
                text = "bbb"
            }) {
                Text("bbb")
            }
            Button(action: {
                text = "ccc"
            }) {
                Text("ccc")
            }
        }
    }
}

struct No56_Previews: PreviewProvider {
    static var previews: some View {
        No56()
    }
}

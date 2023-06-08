//
//  No54.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/08.
//

import SwiftUI

struct No54: View {
    @State var text = ""
    @State var isPresented = false
    var body: some View {
        VStack(spacing: 16) {
            TextField("Placeholder", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                isPresented.toggle()
            }) {
                Text("Show Modal")
            }.sheet(isPresented: $isPresented) {
                No54_2(text: text)
            }
        }.padding()
    }
}

struct No54_2: View {
    let text: String
    var body: some View {
        Text(text)
    }
}

struct No54_Previews: PreviewProvider {
    static var previews: some View {
        No54()
    }
}

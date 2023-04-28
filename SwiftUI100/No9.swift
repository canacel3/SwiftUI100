//
//  No9.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/04/28.
//

import SwiftUI

struct No9: View {
    @State var text = "Hello world"
    var body: some View {
        VStack {
            Button(action: {
                self.text = "yeah"
            }) {
                Text("Tap me!")
            }
            Text(text)
        }
    }
}

struct No9_Previews: PreviewProvider {
    static var previews: some View {
        No9()
    }
}

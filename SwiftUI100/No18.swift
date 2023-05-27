//
//  No18.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/05/27.
//

import SwiftUI

struct No18: View {
    @State var text = "Hey"
    var body: some View {
        VStack {
            Text(text)
            Button(action: {
                text = "Hello"
            }, label: {
                HStack {
                    Image("cat")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    Text("Tap!!")
                }
            }).buttonStyle(.plain)
        }
    }
}

struct No18_Previews: PreviewProvider {
    static var previews: some View {
        No18()
    }
}

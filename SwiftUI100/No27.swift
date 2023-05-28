//
//  No27.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/05/28.
//

import SwiftUI

struct No27: View, MyProtocol {
    @State var text: String = "My Text"
    var body: some View {
        NavigationStack {
            VStack {
                Text(text)
                NavigationLink(destination: {
                    SecondView(delegate: self)
                }, label: {
                    Text("2nd View")
                })
            }
        }
    }

    func myFunc() {
        text = "Change Text"
    }
}

protocol MyProtocol {
    func myFunc()
}

struct SecondView: View {
    var delegate: MyProtocol
    var body: some View {
        Button(action: {
            delegate.myFunc()
        }) {
            Text("ChangeText")
        }
    }
}

struct No27_Previews: PreviewProvider {
    static var previews: some View {
        No27()
    }
}

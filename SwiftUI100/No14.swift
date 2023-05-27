//
//  No14.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/05/27.
//

import SwiftUI

struct No14: View {
    @State var isShowingAlert = false
    var body: some View {
        Button(action: {
            isShowingAlert = true
        }, label: {
            Text("Tap")
        }).alert(isPresented: $isShowingAlert) {
            Alert(
                title: Text("Title"),
                message: Text("Message"),
                primaryButton: .default(Text("ボタン1")) {
                    print("ボタン1")
                },
                secondaryButton: .default(Text("ボタン2")) {
                    print("ボタン2")
                })
        }
    }
}

struct No14_Previews: PreviewProvider {
    static var previews: some View {
        No14()
    }
}

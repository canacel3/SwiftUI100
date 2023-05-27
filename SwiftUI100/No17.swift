//
//  No17.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/05/27.
//

import SwiftUI

struct No17: View {
    @State var isShowingAlert1 = false
    @State var isShowingAlert2 = false
    var body: some View {
        VStack {
            Button(action: {
                isShowingAlert1 = true
            }, label: {
                Text("Tap 1")
            }).alert(isPresented: $isShowingAlert1) {
                Alert(
                    title: Text("Title1"),
                    message: Text("Message1"),
                    primaryButton: .default(Text("ボタン1 1")) {
                        print("ボタン1 1")
                    },
                    secondaryButton: .default(Text("ボタン2 1")) {
                        print("ボタン2 1")
                    })
            }
            Button(action: {
                isShowingAlert2 = true
            }, label: {
                Text("Tap 2")
            }).alert(isPresented: $isShowingAlert2) {
                Alert(
                    title: Text("Title2"),
                    message: Text("Message2"),
                    primaryButton: .default(Text("ボタン1 2")) {
                        print("ボタン1 2")
                    },
                    secondaryButton: .default(Text("ボタン2 2")) {
                        print("ボタン2 2")
                    })
            }
        }
    }
}

struct No17_Previews: PreviewProvider {
    static var previews: some View {
        No17()
    }
}

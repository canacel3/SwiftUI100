//
//  No26.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/05/27.
//

import SwiftUI

fileprivate struct Stone: Identifiable {
    let id = UUID()
    let name: String
}

struct No26: View {
    @State private var stones: [Stone] = [
        Stone(name: "Cobblestone"),
        Stone(name: "Stone"),
        Stone(name: "Smooth Stone")]
    @State private var isShowingAlert: Bool = false
    @State private var alertEntity: AlertEntity?

    struct AlertEntity {
        let title: String
        let message: String
        let actionText: String
    }

    var body: some View {
        List(stones) { stone in
            Button(action: {
                alertEntity = AlertEntity(title: "Name",
                                          message: stone.name,
                                          actionText: "OK")
                isShowingAlert = true
            }) {
                Text(stone.name).foregroundColor(Color.black)
            }.alert(alertEntity?.title ?? "",
                    isPresented: $isShowingAlert,
                    presenting: alertEntity) { entity in
                Button(entity.actionText) {
                    print(entity.actionText)
                }
            } message: { entity in
                Text(entity.message)
            }
        }
    }
}

struct No26_Previews: PreviewProvider {
    static var previews: some View {
        No26()
    }
}

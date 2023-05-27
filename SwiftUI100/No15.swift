//
//  No15.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/05/27.
//

import SwiftUI

struct No15: View {
    @State var isShowingAlert = false
    @State var alertEntity: AlertEntity?

    struct AlertEntity {
        let title: String
        let message: String
        let actionText: String
    }

    var body: some View {
        Button("Tap") {
            alertEntity = AlertEntity(
                title: "Title",
                message: "Message",
                actionText: "OK")
            isShowingAlert.toggle()
        }
        .alert(
            alertEntity?.title ?? "",
            isPresented: $isShowingAlert,
            presenting: alertEntity
        ) { entity in
            Button(entity.actionText) {
                print(entity.actionText)
            }
        } message: { entity in
            Text(entity.message)
        }
    }
}

struct No15_Previews: PreviewProvider {
    static var previews: some View {
        No15()
    }
}

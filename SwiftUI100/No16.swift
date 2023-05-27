//
//  No16.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/05/27.
//

import SwiftUI

struct No16: View {
    @State var isShowingAlert = false
    @State var alertEntity: AlertEntity?

    struct AlertEntity {
        let title: String
        let message: String
        let actionText: String
    }

    var body: some View {
        VStack {
            Button("Tap 1") {
                alertEntity = AlertEntity(
                    title: "Title1",
                    message: "Message1",
                    actionText: "OK1")
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
            Button("Tap 2") {
                alertEntity = AlertEntity(
                    title: "Title2",
                    message: "Message2",
                    actionText: "OK2")
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
}

struct No16_Previews: PreviewProvider {
    static var previews: some View {
        No16()
    }
}

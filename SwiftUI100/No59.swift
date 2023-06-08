//
//  No59.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/08.
//

import SwiftUI

struct No59: View {
    @State private var isShowingVStackAlert = false
    @State private var isShowingHStackAlert = false
    @State var alertEntity: AlertEntity?

    struct AlertEntity {
        let title: String
        let message: String
        let actionText: String
    }

    var body: some View {
        HStack {
            VStack(spacing: 16) {
                Button(action: {
                    isShowingVStackAlert = true
                    alertEntity = AlertEntity(
                        title: "VStack",
                        message: "VStack",
                        actionText: "OK")
                }) {
                    Text("Show VStack Alert")
                }
                Button(action: {
                    isShowingHStackAlert = true
                    alertEntity = AlertEntity(
                        title: "HStack",
                        message: "HStack",
                        actionText: "OK")
                }) {
                    Text("Show HStack Alert")
                }
            }.alert(
                alertEntity?.title ?? "",
                isPresented: $isShowingVStackAlert,
                presenting: alertEntity
            ) { entity in
                Button(entity.actionText) {
                    print(entity.actionText)
                }
            } message: { entity in
                Text(entity.message)
            }
        }.alert(
            alertEntity?.title ?? "",
            isPresented: $isShowingHStackAlert,
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

struct No59_Previews: PreviewProvider {
    static var previews: some View {
        No59()
    }
}

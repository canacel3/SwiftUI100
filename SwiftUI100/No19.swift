//
//  No19.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/05/27.
//

import SwiftUI

struct No19: View {
    @State private var text = ""
    @State private var isShowingSheet = false
    @State private var isShowingAlert = false
    @State var alertEntity: AlertEntity?

    struct AlertEntity {
        let title: String
        let message: String
        let actionText: String
    }

    var body: some View {
        VStack {
            TextField("Input Number...", text: $text)
                .textFieldStyle(.roundedBorder)
                .padding()
            Button(action: {
                guard Double(text) != nil else {
                    alertEntity = AlertEntity(
                        title: "不正な値です",
                        message: "数字を入力してください",
                        actionText: "OK")
                    isShowingAlert.toggle()
                    return
                }
                isShowingSheet.toggle()
            }, label: {
                Text("Show Sheet")
            })
            .sheet(isPresented: $isShowingSheet) {
                No19_2()
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

struct No19_Previews: PreviewProvider {
    static var previews: some View {
        No19()
    }
}

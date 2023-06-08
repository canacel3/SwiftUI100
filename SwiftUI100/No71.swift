//
//  No71.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/09.
//

import SwiftUI
import UIKit

struct No71: View {
    @State private var isPresented: Bool = false
    var body: some View {
        Button("ActivityController表示") {
            isPresented.toggle()
        }
        .sheet(isPresented: $isPresented) {
            ActivityView(activityItems: ["シェア"],
                         applicationActivities: nil)
            .presentationDetents([.medium, .large])
        }
    }
}

private struct ActivityView: UIViewControllerRepresentable {
    let activityItems: [Any]
    let applicationActivities: [UIActivity]?
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {}
}

struct No71_Previews: PreviewProvider {
    static var previews: some View {
        No71()
    }
}

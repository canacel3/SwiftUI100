//
//  No73.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/09.
//

import SwiftUI

struct No73: View {
    @State private var isShowingIndicator = true
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Button(action: {
                    isShowingIndicator.toggle()
                }) {
                    Text("Show or Hide Indicator")
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Color.gray)
                }
            }

            if isShowingIndicator {
                ActivityIndicator()
                    .padding(12)
                    .background(Color.gray.opacity(0.8))
                    .cornerRadius(12)
            }
        }
    }
}

private struct ActivityIndicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.color = UIColor.white
        uiView.style = .large
        uiView.startAnimating()
    }
}

struct No73_Previews: PreviewProvider {
    static var previews: some View {
        No73()
    }
}

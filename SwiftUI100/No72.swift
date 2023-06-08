//
//  No72.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/09.
//

import SwiftUI

struct No72: View {
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
            }
        }
    }
}

private struct ActivityIndicator: UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .large)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        uiView.startAnimating()
    }
}

struct No72_Previews: PreviewProvider {
    static var previews: some View {
        No72()
    }
}

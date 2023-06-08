//
//  No58.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/08.
//

import SwiftUI

struct No58: View {
    @State private var isShowingPopup: Bool = false
    var body: some View {
        ZStack {
            Button(action: {
                withAnimation {
                    isShowingPopup = true
                }
            }) {
                Text("Tap!")
            }

            if isShowingPopup {
                No58_2(isPresent: $isShowingPopup)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

struct No58_2: View {
    @Binding var isPresent: Bool
    var body: some View {
        VStack {
            VStack {
                Image("cat")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                Button(action: {
                    withAnimation {
                        isPresent = false
                    }
                }) {
                    Text("Close")
                }
            }
            .padding()
            .background(Color.white)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.gray)
        .ignoresSafeArea()
    }
}

struct No58_Previews: PreviewProvider {
    static var previews: some View {
        No58()
    }
}

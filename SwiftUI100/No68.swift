//
//  No68.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/09.
//

import SwiftUI

struct No68: View {
    private let stones = ["Cobblestone", "Stone", "SmoothStone"]
    var body: some View {
        List(stones, id: \.self) { stone in
            HStack(alignment: .center) {
                Text(stone)
                Spacer()
                Button(action: {
                    print("\(stone) Left")
                }) {
                    Text("Left")
                        .padding()
                        .border(Color.green)
                }
                .buttonStyle(PlainButtonStyle())
                Button(action: {
                    print("\(stone) Right")
                }) {
                    Text("Right")
                        .padding()
                        .border(Color.blue)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .contentShape(Rectangle())
            .onTapGesture {
                print("\(stone) Cell")
            }
        }
    }
}

struct No68_Previews: PreviewProvider {
    static var previews: some View {
        No68()
    }
}

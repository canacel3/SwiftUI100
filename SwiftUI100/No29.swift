//
//  No29.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/05/28.
//

import SwiftUI

struct No29: View {
    @State private var selectedHour = 8
    @State private var selectedMinute = 30
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Picker(selection: $selectedHour, content: {
                    ForEach(0..<24) {
                        Text("\($0)")
                    }
                }) {
                    EmptyView()
                }.pickerStyle(WheelPickerStyle())
                    .onReceive([selectedHour].publisher.first()) { value in
                        print("hour: \(value)")
                }.labelsHidden()
                    .frame(width: geometry.size.width / 2,
                           height: geometry.size.height)
                    .clipped()
                Picker(selection: $selectedMinute, content: {
                    ForEach(0..<60) {
                        Text("\($0)")
                    }
                }) {
                    EmptyView()
                }.pickerStyle(WheelPickerStyle())
                    .onReceive([selectedMinute].publisher.first()) { value in
                        print("minute: \(value)")
                }.labelsHidden()
                    .frame(width: geometry.size.width / 2,
                           height: geometry.size.height)
                    .clipped()
            }
        }
    }
}

struct No29_Previews: PreviewProvider {
    static var previews: some View {
        No29()
    }
}

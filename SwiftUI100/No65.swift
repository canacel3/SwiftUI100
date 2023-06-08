//
//  No65.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/09.
//

import SwiftUI

struct No65: View {
    @State private var isPresented: Bool = false
    var body: some View {
        Button(action: {
            isPresented.toggle()
        }) {
            Text("Show Sheet")
        }.sheet(isPresented: $isPresented) {
            No65_2(isShowingSheet: $isPresented)
        }
    }
}

struct No65_2: View {
    @Binding var isShowingSheet: Bool
    @State private var isPresented: Bool = false
    var body: some View {
        NavigationStack {
            Button(action: {
                isPresented.toggle()
            }) {
                Text("Go to SecondSheet")
            }.navigationDestination(isPresented: $isPresented) {
                No65_3(isShowingSheet: $isShowingSheet)
            }.navigationTitle("First Sheet")
        }
    }
}

struct No65_3: View {
    @Binding var isShowingSheet: Bool
    var body: some View {
        Button(action: {
            isShowingSheet = false
        }) {
            Text("Close Sheet")
        }.navigationTitle("Second Sheet")
    }
}

struct No65_Previews: PreviewProvider {
    static var previews: some View {
        No65()
    }
}

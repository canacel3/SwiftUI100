//
//  No86.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/09.
//

import SwiftUI

struct No86: View {
    @State var items: [String] = []
    @State var isPresented: Bool = false

    var body: some View {
        VStack {
            Text("Count: \(items.count)")
            Button("Show Sheet") {
                isPresented.toggle()
            }
        }
        .sheet(isPresented: $isPresented) {
            No86_2(items: $items)
        }
    }
}

final class No86_2ViewState: ObservableObject {
    @Binding var bindingItems: [String]
    @Published var items: [String] {
        didSet {
            bindingItems = items
        }
    }

    init(items: Binding<[String]>) {
        self.items = items.wrappedValue
        self._bindingItems = items
    }

    func addItem() {
        items.append("Mac Book Pro")
    }
}

struct No86_2: View {
    @StateObject var viewState: No86_2ViewState

    init(items: Binding<[String]>) {
        self._viewState = StateObject(wrappedValue: No86_2ViewState(items: items))
    }

    var body: some View {
        VStack {
            Text("Count: \(viewState.items.count)")
            Button("Add Item") {
                viewState.addItem()
            }
        }
    }
}

struct No86_Previews: PreviewProvider {
    static var previews: some View {
        No86()
    }
}

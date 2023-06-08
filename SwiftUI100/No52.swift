//
//  No52.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/09.
//

import SwiftUI

struct No52: View, No52_2Delegate {
    @State private var todos: [String] = ["a", "b"]
    @State private var isPresented: Bool = false

    var body: some View {
        NavigationStack {
            ZStack(alignment: .bottomTrailing) {
                List {
                    ForEach(todos, id: \.self) { todo in
                        Text(todo)
                    }
                    .onDelete(perform: delete)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {}) {
                            EditButton()
                        }
                    }
                }
                .navigationTitle("TODO")
                
                
                Button(action: {
                    isPresented.toggle()
                }, label: {
                    Text("Add")
                        .foregroundColor(Color.white)
                        .font(Font.system(size: 20))
                })
                .frame(width: 60, height: 60)
                .background(Color.orange)
                .padding()
                .navigationDestination(isPresented: $isPresented) {
                    No52_2(delegate: self, text: "")
                }
            }
        }
    }

    func addTodo(text: String) {
        todos.append(text)
    }

    private func delete(at offsets: IndexSet) {
        todos.remove(atOffsets: offsets)
    }
}

protocol No52_2Delegate {
    func addTodo(text: String)
}

struct No52_2: View {
    @Environment(\.dismiss) var dismiss
    let delegate: No52_2Delegate
    @State var text: String

    var body: some View {
        VStack(spacing: 16) {
            TextField("Input your TODO", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Add") {
                delegate.addTodo(text: text)
                dismiss()
            }
        }
        .padding()
    }
}

struct No52_Previews: PreviewProvider {
    static var previews: some View {
        No52()
    }
}

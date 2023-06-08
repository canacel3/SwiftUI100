//
//  No57.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/06/08.
//

import SwiftUI

struct No57: View {
    @State private var isPresented: Bool = false
    @State private var height: String = ""
    @State private var weight: String = ""
    @State private var bmi: Double = 0
    var body: some View {
        VStack(spacing: 32) {
            TextField("身長", text: $height)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("体重", text: $weight)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                guard let height = Double(height),
                      let weight = Double(weight) else { return }
                bmi = weight / (height / 100) / (height / 100)
                isPresented.toggle()
            }) {
                Text("計算")
            }.sheet(isPresented: $isPresented) {
                No57_2(bmi: $bmi)
            }
        }.padding()
    }
}

struct No57_2: View {
    @Binding var bmi: Double
    var body: some View {
        Text("あなたの BMI は \(bmi) です！")
    }
}

struct No57_Previews: PreviewProvider {
    static var previews: some View {
        No57()
    }
}

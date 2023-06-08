//
//  ContentView.swift
//  SwiftUI100
//
//  Created by 西田楓 on 2023/03/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink(destination: No1()) {
                        Text("No. 1")
                    }
                    NavigationLink(destination: No2()) {
                        Text("No. 2")
                    }
                    NavigationLink(destination: No3()) {
                        Text("No. 3")
                    }
                    NavigationLink(destination: No4()) {
                        Text("No. 4")
                    }
                    NavigationLink(destination: No5()) {
                        Text("No. 5")
                    }
                    NavigationLink(destination: No6()) {
                        Text("No. 6")
                    }
                    NavigationLink(destination: No7()) {
                        Text("No. 7")
                    }
                    NavigationLink(destination: No8()) {
                        Text("No. 8")
                    }
                    NavigationLink(destination: No9()) {
                        Text("No. 9")
                    }
                    NavigationLink(destination: No10()) {
                        Text("No. 10")
                    }
                } header: {
                    Text("No.1 ~ No.10")
                }
                Section {
                    NavigationLink(destination: No11()) {
                        Text("No. 11")
                    }
                    NavigationLink(destination: No12()) {
                        Text("No. 12")
                    }
                    NavigationLink(destination: No13()) {
                        Text("No. 13")
                    }
                    NavigationLink(destination: No14()) {
                        Text("No. 14")
                    }
                    NavigationLink(destination: No15()) {
                        Text("No. 15")
                    }
                    NavigationLink(destination: No16()) {
                        Text("No. 16")
                    }
                    NavigationLink(destination: No17()) {
                        Text("No. 17")
                    }
                    NavigationLink(destination: No18()) {
                        Text("No. 18")
                    }
                    NavigationLink(destination: No19()) {
                        Text("No. 19")
                    }
                    NavigationLink(destination: No20()) {
                        Text("No. 20")
                    }
                } header: {
                    Text("No.11 ~ No.20")
                }
                Section {
                    NavigationLink(destination: No21()) {
                        Text("No. 21")
                    }
                    NavigationLink(destination: No22()) {
                        Text("No. 22")
                    }
                    NavigationLink(destination: No23()) {
                        Text("No. 23")
                    }
                    NavigationLink(destination: No24()) {
                        Text("No. 24")
                    }
                    NavigationLink(destination: No25()) {
                        Text("No. 25")
                    }
                    NavigationLink(destination: No26()) {
                        Text("No. 26")
                    }
                    NavigationLink(destination: No27()) {
                        Text("No. 27")
                    }
                    Text("No. 28(このページでやってることなので省略)")
                    NavigationLink(destination: No29()) {
                        Text("No. 29")
                    }
                    NavigationLink(destination: No30()) {
                        Text("No. 30")
                    }
                } header: {
                    Text("No.21 ~ No.30")
                }
                Section {
                    NavigationLink(destination: No31()) {
                        Text("No. 31")
                    }
                    NavigationLink(destination: No32()) {
                        Text("No. 32")
                    }
                    NavigationLink(destination: No33()) {
                        Text("No. 33")
                    }
                    NavigationLink(destination: No34()) {
                        Text("No. 34")
                    }
                    NavigationLink(destination: No35()) {
                        Text("No. 35")
                    }
                    NavigationLink(destination: No36()) {
                        Text("No. 36")
                    }
                    NavigationLink(destination: No37()) {
                        Text("No. 37")
                    }
                    NavigationLink(destination: No38()) {
                        Text("No. 38")
                    }
                    NavigationLink(destination: No39()) {
                        Text("No. 39")
                    }
                    NavigationLink(destination: No40()) {
                        Text("No. 40")
                    }
                } header: {
                    Text("No.31 ~ No.40")
                }
                Section {
                    NavigationLink(destination: No41()) {
                        Text("No. 41")
                    }
                    NavigationLink(destination: No46()) {
                        Text("No. 46")
                    }
                    Text("No. 47 (No. 46 と同じなので省略)")
                    NavigationLink(destination: No48()) {
                        Text("No. 48")
                    }
                    NavigationLink(destination: No49()) {
                        Text("No. 49")
                    }
                } header: {
                    Text("No.41 ~ No.50")
                }
                Section {
                    NavigationLink(destination: No54()) {
                        Text("No. 54")
                    }
                    NavigationLink(destination: No55()) {
                        Text("No. 55")
                    }
                    NavigationLink(destination: No56()) {
                        Text("No. 56")
                    }
                    NavigationLink(destination: No57()) {
                        Text("No. 57")
                    }
                    NavigationLink(destination: No58()) {
                        Text("No. 58")
                    }
                } header: {
                    Text("No.51 ~ No.60")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

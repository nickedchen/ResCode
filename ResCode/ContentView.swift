//
//  ContentView.swift
//  ResCode
//
//  Created by Nick Chen on 2022-10-26.
//

import SwiftUI

fileprivate
let tabColors: [Color] = [
    Color.accentColor,
    Color("EasternBlue"),
    Color.gray,
]

struct ContentView: View {
    @State private var selectedIndex: Int = 0
    @State var tabSelection: Int = 0
    @State private var tabColor: Color!
    
    init() {
           self.tabColor = tabColors[0]
       }

    var body: some View {
        
        CalculatorView()
//        TabView(selection: $selectedIndex){
//            CalculatorView()
//                .tabItem{
//                    Label("Decoder",systemImage: "lines.measurement.horizontal")
//                }
//                .tag(0)
//                .onAppear(perform: { tabColor = tabColors[0] })
//
//            ConverterView(resistorData: ResistorData(resistance: "", selectedType: "4", coefficient: "", tolerance: ""))
//                .tabItem{
//                    Label("Converter",systemImage: "arrow.2.squarepath")
//                }
//                .tag(1)
//                .onAppear(perform: { tabColor = tabColors[1] })
//
//            HistoryView()
//                .tabItem{
//                    Label("LabBook",systemImage: "list.clipboard")
//                }
//                .tag(2)
//                .onAppear(perform: { tabColor = tabColors[2] })
//
//        }
//        .accentColor(tabColor ?? tabColors[0])
//        .font(.headline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

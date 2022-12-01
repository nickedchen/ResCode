//
//  HistoryDetailView.swift
//  ResCode
//
//  Created by Nick Chen on 2022-11-23.
//

import SwiftUI

var name = "Resistor 1"
var description = "The resistor has 4 bands, green purple blue and yellow"
var isvalid: Bool = true

struct HistoryDetailView: View {
    var body: some View {
        NavigationStack{
            Form {
                Section() {
                    Image("ListIcon")
                        .resizable()
                        .cornerRadius(12.0)
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    
                    Text(name)
                        .font(.headline)
                    
                    Text(description)
                        .font(.body)
                    
                    HStack {
                        Text("Hybrid").font(.headline)
                        Spacer()
                        Image(systemName: isvalid ?
                              "checkmark.circle" : "xmark.circle" )
                    }
                }
            }
            .navigationTitle("Details")
        }
    }
}

struct HistoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryDetailView()
    }
}

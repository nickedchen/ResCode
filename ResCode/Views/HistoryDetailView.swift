//
//  HistoryDetailView.swift
//  ResCode
//
//  Created by Nick Chen on 2022-11-23.
//

import SwiftUI

var name = "Four banded Resistor"
var description = "The resistor has a value of 220Ω, with a tolerance up to 0.5%. \n \nBand Colour from left to right: Green, Purple, Blue and Yellow"
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
                    
                    HStack{
                        Text(name)
                            .font(.headline)
                        Spacer()
                        ZStack{
                            Capsule()
                                .fill(Color("AccentColor"))
                                .frame(width: 100,height: 30)
                            Text("Decoded")
                                .font(.callout).bold()
                                .foregroundColor(.white)
                        }
                    }
                    
                    Text(description)
                        .font(.body)
                    
                    HStack {
                        Text("Valid Resistor").font(.headline)
                        Spacer()
                        Image(systemName: isvalid ?
                              "checkmark.circle.fill" : "xmark.circle.fill" )
                        .foregroundColor(Color.blue)
                    }
                }
            }
            .navigationTitle("Resistor")
        }
    }
}

struct HistoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryDetailView()
    }
}

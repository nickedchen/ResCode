//
//  ConverterView.swift
//  ResCode
//
//  Created by Nick Chen on 2022-11-11.
//

import SwiftUI
import Foundation

struct ConverterView: View {
    
    @ObservedObject var resistorData : ResistorData
    
    
    var resistancePlaceholer = "Enter resistor value"
    var tolerancePlaceholder = "Choose tolerance value"
    var TCRPlaceholder = "Choose temperature coefficient value"
    var toleranceDropDownList = [
        "Brown ± 1%(F)",
        "Red ± 2%(G)",
        "Green ± 0.5%(D)",
        "Blue ± 0.25%(C)",
        "Violet ± 0.10%(B)",
        "Grey ± 0.05%",
        "Gold ± 5%(J)",
        "Silver ± 10%(K)",
    ]
    var TCRDropDownList = [
        "Black 250(U)",
        "Brown 100(S)",
        "Red 50(R)",
        "Orange 15(P)",
        "Yellow 25(Q)",
        "Green 20(Z)",
        "Blue 10(2)",
        "Violet 5(M)",
        "Grey 1(K)"
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                ZStack{
                    RoundedRectangle(cornerRadius: 20,style: .continuous)
                        .fill(Color("EasternBlue"))
                    
                    HStack{
                        VStack{
                            HStack{
                                Text("Convert value into colour bands")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16))
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            Spacer().frame(height: 5)
                            HStack{
                                Text("Select resistor values below and number of bands to visualize your resistor code")
                                    .foregroundColor(.white)
                                    .font(.custom("SF Compact Display", size: 14))
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.leading)
                                
                                Spacer()
                            }
                        }
                        Image(systemName: "textformat.123")
                            .resizable()
                            .frame(width: 56,height:28)
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.all)
                }
                .frame(height: 94)
                .padding(.horizontal)
                
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20,style: .continuous)
                        .fill(Color("ConverterBackground"))
                        .opacity(0.57)
                    VStack{
                        HStack{
                            VStack(alignment: .leading){
                                Text("Resistance")
                                    .foregroundColor(Color("ConverterText"))
                                    .font(.system(size: 20))
                                    .bold()
                                TextField("Enter Value Here", text: $resistorData.resistance)
                                    .foregroundColor(Color("ConverterText2"))
                                    .font(.system(size: 15))
                                    .bold()
                                   
                            }
                            Spacer()
                        }
                        .padding()
                        
                    }
                }
                .frame(height: 94)
                .padding(.horizontal)
                .padding(.top)
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20,style: .continuous)
                        .fill(Color("ConverterBackground"))
                        .opacity(0.57)
                    VStack{
                        HStack{
                            VStack(alignment: .leading){
                                Text("Tolerance")
                                    .foregroundColor(Color("ConverterText"))
                                    .font(.system(size: 20))
                                    .bold()
                                Menu {
                                    ForEach(toleranceDropDownList, id: \.self) { tolerance in
                                        Button(tolerance) {
                                            self.resistorData.tolerance = tolerance
                                        }
                                    }
                                } label: {
                                    VStack(spacing: 5) {
                                        HStack {
                                            Text(resistorData.tolerance.isEmpty ?
                                                 tolerancePlaceholder : resistorData.tolerance)
                                            .foregroundColor(resistorData.tolerance.isEmpty ? Color("ConverterText2").opacity(0.5) : .black)
                                                .font(.system(size: 15))
                                                .bold()
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(Color("EasternBlue"))
                                                .font(Font.system(size: 20, weight: .bold))
                                        }
                                        
                                    }
                                }
                                   
                            }
                        }
                        .padding()
                        
                    }
                }
                .frame(height: 94)
                .padding(.horizontal)
                .padding(.top)
                
                ZStack{
                    RoundedRectangle(cornerRadius: 20,style: .continuous)
                        .fill(Color("ConverterBackground"))
                        .opacity(0.57)
                    VStack{
                        HStack{
                            VStack(alignment: .leading){
                                Text("Temperature Coefficient")
                                    .foregroundColor(Color("ConverterText"))
                                    .font(.system(size: 20))
                                    .bold()
                                Menu {
                                    ForEach(TCRDropDownList, id: \.self) { coefficient in
                                        Button(coefficient) {
                                            resistorData.coefficient = coefficient
                                        }
                                    }
                                } label: {
                                    VStack(spacing: 5) {
                                        HStack {
                                            Text(resistorData.coefficient.isEmpty ? TCRPlaceholder : resistorData.coefficient)
                                                .foregroundColor(resistorData.coefficient.isEmpty ? Color("ConverterText2").opacity(0.5) : .black)
                                                .font(.system(size: 15))
                                                .bold()
                                            Spacer()
                                            Image(systemName: "chevron.right")
                                                .foregroundColor(Color("EasternBlue"))
                                                .font(Font.system(size: 20, weight: .bold))
                                        }
                                        
                                    }
                                }
                                   
                            }
                        }
                        .padding()
                        
                    }
                }
                .frame(height: 94)
                .padding(.horizontal)
                .padding(.top)

                GroupBox(label: Text("Resistor Types")) {
                    Section {
                        Picker("Choose resistor type", selection: $resistorData.selectedType) {
                            ForEach(resistorTypes, id: \.self) {
                                Text($0)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
                .padding(.all)
                .foregroundColor(Color("EasternBlue"))

            }
            NavigationLink(destination: ResultView()) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20,style: .continuous)
                        .fill(Color("ConverterBackground"))
                        .frame(height: 67)
                        .padding(.horizontal)
                    Text("Convert")
                        .font(.title3)
                        .bold()
                        .foregroundColor(Color("ConverterText"))
                }
            }
            .padding(.bottom)
            .navigationTitle("Converter")
        }
        .accentColor(Color("EasternBlue"))
    }
}

struct ConverterGroupBox: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            HStack {
                configuration.label
                    .font(.headline)
                Spacer()
            }

            configuration.content
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 20, style: .continuous)
            .fill(Color("SeaGreen")))
    }
}

struct ConverterView_Previews: PreviewProvider {
    static var previews: some View {
        ConverterView(resistorData: ResistorData(resistance: "", selectedType: "4", coefficient: "", tolerance: ""))
    }
}

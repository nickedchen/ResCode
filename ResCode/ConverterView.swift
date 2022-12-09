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
                    RoundedRectangle(cornerRadius: 10,style: .continuous)
                        .fill(Color("SeaGreen"))
                    
                    HStack{
                        VStack{
                            HStack{
                                Text("Convert value into colour bands")
                                    .foregroundColor(.white)
                                    .font(.headline)
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.leading)
                                Spacer()
                            }
                            Spacer()
                            HStack{
                                Text("Select resistor values below and number of bands to visualize your resistor code")
                                    .foregroundColor(.white)
                                    .font(.subheadline)
                                    .fontWeight(.regular)
                                    .multilineTextAlignment(.leading)
                                
                                Spacer()
                            }
                        }
                        Image(systemName: "rectangle.and.hand.point.up.left")
                            .resizable()
                            .frame(width: 45,height: 45)
                            .foregroundColor(.white)
                            .padding(.leading)
                    }
                    .padding(.all)
                }
                .padding(.horizontal)
                
                GroupBox(
                    label: Text("Resistance (Ω)")
                    .foregroundColor(Color("EasternBlue"))
                ) {
                    Section {
                        TextField("Enter Value Here", text: $resistorData.resistance)
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                

                GroupBox(label: Text("Tolerance (%)")
                    .foregroundColor(Color("EasternBlue"))) {
                    Section {
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
                                        .foregroundColor(resistorData.tolerance.isEmpty ? .gray.opacity(0.5) : .black)
                                    Spacer()
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(Color("EasternBlue"))
                                        .font(Font.system(size: 20, weight: .bold))
                                }
                                
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                

                GroupBox(label: Text("Temperature Coefficient (ppm/K)")) {
                    Section {
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
                                        .foregroundColor(resistorData.coefficient.isEmpty ? .gray.opacity(0.5) : .black)
                                    Spacer()
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(Color("EasternBlue"))
                                        .font(Font.system(size: 20, weight: .bold))
                                }
                                
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top)
                .foregroundColor(Color("EasternBlue"))

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
            .navigationTitle("Converter")
            
            NavigationLink(destination: ResultView()) {
                ZStack {
                    Rectangle()
                        .fill(Color("EasternBlue"))
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        .frame(height: 52)
                        .padding(.horizontal)

                    Text("Convert")
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
            .padding(.bottom)
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

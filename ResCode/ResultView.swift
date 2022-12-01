//
//  ResultView.swift
//  ResCode
//
//  Created by Nick Chen on 2022-11-11.
//

import SwiftUI

struct Configs: Identifiable {
    let id = UUID()
    let title: String
    let value: Double
}

struct ResultView: View {
    @EnvironmentObject var resistorData: ResistorData

    let configs = [
        Configs(title: "Resistance", value: 10),
        Configs(title: "Tolerance", value: 20),
        Configs(title: "Multiplier", value: 13),
        Configs(title: "Coefficient", value: 50)]

    var body: some View {
        NavigationStack {
            List {
                Section(header:
                    VStack(alignment: .leading) {
                        Text("Your Configuration").font(.title2).bold()
                        Text("Four Band Resistor").font(.headline)
                            .fontWeight(.regular)
                            .opacity(0.5)
                    }
                ) {
                    ScrollView(.horizontal) {
                        HStack {
                            Spacer().frame(width: 20.0)
                            ForEach(configs) { config in
                                GroupBox(
                                    label:
                                    HStack {
                                        Text(config.title)
                                            .foregroundColor(Color("EasternBlue"))
                                            .fontWeight(.bold)
                                            .font(.title3)
                                        Spacer()
                                    }
                                ) {
                                    Spacer()
                                    HStack {
                                        Spacer()
                                        Text(String(format: "%.1f", config.value))
                                            .font(.largeTitle)
                                            .fontWeight(.heavy)
                                            .foregroundColor(Color("EasternBlue")).opacity(0.8)
                                    }
                                }
                                .frame(width: 160, height: 150)
                                .groupBoxStyle(ColoredGroupBox())
                                .padding(.all, 0.1)
                            }
                            Spacer().frame(width: 20.0)
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .listRowInsets(.init())
                }
                .headerProminence(.increased)
                .listRowSeparator(.hidden)
                .listRowBackground(Color("Clear"))

                Section(
                    header:
                    VStack(alignment: .leading) {
                        Text("Coloured Code").font(.title2).bold()
                    }
                ) {
                    GroupBox {
                        VStack {
                            Spacer()
                            HStack(spacing: 10) {
                                ForEach(0 ..< 4) { _ in
                                    VStack {
                                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                                            .fill(Color("EasternBlue"))
                                            .frame(height: 220)
                                            .padding(.all, 0.1)
                                        Spacer()
                                        Text("Blue")
                                            .foregroundColor(Color("EasternBlue"))
                                            .fontWeight(.medium)
                                    }
                                }
                            }
                        }
                    }
                    .groupBoxStyle(ColoredGroupBox())
                }
                .listRowSeparator(.hidden)
                .headerProminence(.increased)
                .listRowBackground(Color("Clear"))
            }
            .scrollContentBackground(.hidden)
            .listStyle(.grouped)
            .navigationTitle("Result")
            
            NavigationLink(destination: HistoryView()) {
                ZStack {
                    Rectangle()
                        .fill(Color("EasternBlue"))
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        .frame(height: 52)
                        .padding(.horizontal)
                    Text("Log Result")
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
            .padding(.bottom)
        }
    }

    struct ColoredGroupBox: GroupBoxStyle {
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
            .background(RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(Color("EasternBlue")).opacity(0.1)) // Set your color here!!
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}

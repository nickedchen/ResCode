//
//  CalculatorView.swift
//  ResCode
//
//  Created by Nick Chen on 2022-10-26.
//

import Resistance
import SwiftUI

let url = "https://www.apple.com"

extension UIPickerView {
    override open var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: 200)
    }
}

struct CalculatorView: View {
    // State variables
    @State private var showingSheet = false
    @State private var action = false

    // Resistor parameters
    @State var digit1: Digit = .white
    @State var digit2: Digit = .white
    @State var digit3: Digit = .white
    @State var multiplier: Multiplier = .white
    @State var tolerance: Tolerance = .brown
    @State var coefficient: Coefficient = .brown

    // Resistor type
    @State var selectedType = "4" // default selection

    // Display variables
    @State var resistorValue = "90"
    @State var resistorTolerance = "2"
    @State var resistorTolerancePercentage = "5"
    @State var temperatureCoefficient = "10"

    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ScrollView {
                    VStack {
                        Spacer()
                        GroupBox(
                        ) {
                            switch selectedType {
                            case "5":

                                HStack(spacing: 7) {
                                    Picker("Choose a color", selection: $digit1) {
                                        ForEach(digitValue, id: \.self) {
                                            Text(colorToText(input: $0).prefix(2).uppercased())
                                                .font(.body)
                                                .fontWeight(.bold)
                                                .foregroundColor(changeFontColor(input: digit1))
                                        }
                                    }
                                    .pickerStyle(.wheel)
                                    .frame(width: geometry.size.width / 6.7, height: 250, alignment: .center)
                                    .compositingGroup()
                                    .clipped()
                                    .background(changeColor(input: digit1))
                                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))

                                    Picker("Choose a color", selection: $digit2) {
                                        ForEach(digitValue, id: \.self) {
                                            Text(colorToText(input: $0).prefix(2).uppercased())
                                                .font(.body)
                                                .fontWeight(.bold)
                                                .foregroundColor(changeFontColor(input: digit2))
                                        }
                                    }
                                    .pickerStyle(.wheel)
                                    .frame(width: geometry.size.width / 6.7, height: 250, alignment: .center)
                                    .compositingGroup()
                                    .clipped()
                                    .background(changeColor(input: digit2))
                                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))

                                    Picker("Choose a color", selection: $digit3) {
                                        ForEach(digitValue, id: \.self) {
                                            Text(colorToText(input: $0).prefix(2).uppercased())
                                                .font(.body)
                                                .fontWeight(.bold)
                                                .foregroundColor(changeFontColor(input: digit3))
                                        }
                                    }
                                    .pickerStyle(.wheel)
                                    .frame(width: geometry.size.width / 6.7, height: 250, alignment: .center)
                                    .compositingGroup()
                                    .clipped()
                                    .background(changeColor(input: digit3))
                                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))

                                    Picker("Choose a color", selection: $multiplier) {
                                        ForEach(multiplierValue, id: \.self) {
                                            Text(colorToText(input: $0).prefix(2).uppercased())
                                                .font(.body)
                                                .fontWeight(.bold)
                                                .foregroundColor(changeFontColor(input: multiplier))
                                        }
                                    }
                                    .pickerStyle(.wheel)
                                    .frame(width: geometry.size.width / 6.7, height: 250, alignment: .center)
                                    .compositingGroup()
                                    .clipped()
                                    .background(changeColor(input: multiplier))
                                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))

                                    Picker("Choose a color", selection: $tolerance) {
                                        ForEach(toleranceValue, id: \.self) {
                                            Text(colorToText(input: $0).prefix(2).uppercased())
                                                .font(.body)
                                                .fontWeight(.bold)
                                                .foregroundColor(changeFontColor(input: tolerance))
                                        }
                                    }
                                    .pickerStyle(.wheel)
                                    .frame(width: geometry.size.width / 6.7, height: 250, alignment: .center)
                                    .compositingGroup()
                                    .clipped()
                                    .background(changeColor(input: tolerance))
                                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                                }

                            case "6":
                                HStack(spacing: 6) {
                                    Picker("Choose a color", selection: $digit1) {
                                        ForEach(digitValue, id: \.self) {
                                            Text(colorToText(input: $0).prefix(2).uppercased())
                                                .font(.callout)
                                                .fontWeight(.bold)
                                                .foregroundColor(changeFontColor(input: digit1))
                                        }
                                    }
                                    .pickerStyle(.wheel)
                                    .frame(width: geometry.size.width / 7.8, height: 250, alignment: .center)
                                    .compositingGroup()
                                    .clipped()
                                    .background(changeColor(input: digit1))
                                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))

                                    Picker("Choose a color", selection: $digit2) {
                                        ForEach(digitValue, id: \.self) {
                                            Text(colorToText(input: $0).prefix(2).uppercased())
                                                .font(.callout)
                                                .fontWeight(.bold)
                                                .foregroundColor(changeFontColor(input: digit2))
                                        }
                                    }
                                    .pickerStyle(.wheel)
                                    .frame(width: geometry.size.width / 7.8, height: 250, alignment: .center)
                                    .compositingGroup()
                                    .clipped()
                                    .background(changeColor(input: digit2))
                                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))

                                    Picker("Choose a color", selection: $digit3) {
                                        ForEach(digitValue, id: \.self) {
                                            Text(colorToText(input: $0).prefix(2).uppercased())
                                                .font(.callout)
                                                .fontWeight(.bold)
                                                .foregroundColor(changeFontColor(input: digit3))
                                        }
                                    }
                                    .pickerStyle(.wheel)
                                    .frame(width: geometry.size.width / 7.8, height: 250, alignment: .center)
                                    .compositingGroup()
                                    .clipped()
                                    .background(changeColor(input: digit3))
                                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))

                                    Picker("Choose a color", selection: $multiplier) {
                                        ForEach(multiplierValue, id: \.self) {
                                            Text(colorToText(input: $0).prefix(2).uppercased())
                                                .font(.callout)
                                                .fontWeight(.bold)
                                                .foregroundColor(changeFontColor(input: multiplier))
                                        }
                                    }
                                    .pickerStyle(.wheel)
                                    .frame(width: geometry.size.width / 7.8, height: 250, alignment: .center)
                                    .compositingGroup()
                                    .clipped()
                                    .background(changeColor(input: multiplier))
                                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))

                                    Picker("Choose a color", selection: $tolerance) {
                                        ForEach(toleranceValue, id: \.self) {
                                            Text(colorToText(input: $0).prefix(2).uppercased())
                                                .font(.callout)
                                                .fontWeight(.bold)
                                                .foregroundColor(changeFontColor(input: tolerance))
                                        }
                                    }
                                    .pickerStyle(.wheel)
                                    .frame(width: geometry.size.width / 7.8, height: 250, alignment: .center)
                                    .compositingGroup()
                                    .clipped()
                                    .background(changeColor(input: tolerance))
                                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))

                                    Picker("Choose a color", selection: $coefficient) {
                                        ForEach(coeffiecientValue, id: \.self) {
                                            Text(colorToText(input: $0).prefix(2).uppercased())
                                                .font(.callout)
                                                .fontWeight(.bold)
                                                .foregroundColor(changeFontColor(input: coefficient))
                                        }
                                    }
                                    .pickerStyle(.wheel)
                                    .frame(width: geometry.size.width / 7.8, height: 250, alignment: .center)
                                    .compositingGroup()
                                    .clipped()
                                    .background(changeColor(input: coefficient))
                                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                }

                            default:
                                HStack(spacing: 10) {
                                    Picker("Choose a color", selection: $digit1) {
                                        ForEach(digitValue, id: \.self) {
                                            Text(colorToText(input: $0))
                                                .font(.callout)
                                                .fontWeight(.bold)
                                                .foregroundColor(changeFontColor(input: digit1))
                                                .frame(height: 50)
                                        }
                                    }
                                    .pickerStyle(.wheel)
                                    .frame(width: geometry.size.width / 5.4, height: 250, alignment: .center)
                                    .compositingGroup()
                                    .clipped()
                                    .background(changeColor(input: digit1))
                                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))

                                    Picker("Choose a color", selection: $digit2) {
                                        ForEach(digitValue, id: \.self) {
                                            Text(colorToText(input: $0))
                                                .font(.callout)
                                                .fontWeight(.bold)
                                                .foregroundColor(changeFontColor(input: digit2))
                                        }
                                    }
                                    .pickerStyle(.wheel)
                                    .frame(width: geometry.size.width / 5.4, height: 250, alignment: .center)
                                    .compositingGroup()
                                    .clipped()
                                    .background(changeColor(input: digit2))
                                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))

                                    Picker("Choose a color", selection: $multiplier) {
                                        ForEach(multiplierValue, id: \.self) {
                                            Text(colorToText(input: $0))
                                                .font(.callout)
                                                .fontWeight(.bold)
                                                .foregroundColor(changeFontColor(input: multiplier))
                                        }
                                    }
                                    .pickerStyle(.wheel)
                                    .frame(width: geometry.size.width / 5.4, height: 250, alignment: .center)
                                    .compositingGroup()
                                    .clipped()
                                    .background(changeColor(input: multiplier))
                                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))

                                    Picker("Choose a color", selection: $tolerance) {
                                        ForEach(toleranceValue, id: \.self) {
                                            Text(colorToText(input: $0))
                                                .font(.callout)
                                                .fontWeight(.bold)
                                                .foregroundColor(changeFontColor(input: tolerance))
                                        }
                                    }
                                    .pickerStyle(.wheel)
                                    .frame(width: geometry.size.width / 5.4, height: 250, alignment: .center)
                                    .compositingGroup()
                                    .clipped()
                                    .background(changeColor(input: tolerance))
                                    .clipShape(RoundedRectangle(cornerRadius: 15, style: .continuous))
                                }
                            }
                        }
                        .groupBoxStyle(ColoredGroupBox())
                        .padding(.bottom, 10.0)

                        HStack {
                            GroupBox(label: Label("Resistance",systemImage: "equal")
                                .foregroundColor(.blue)) {
                                    HStack {
                                        ValueView(value: returnResistance(digit1: digit1, digit2: digit2, digit3: digit3, multiplier: multiplier, tolerance: tolerance, coefficient: coefficient, numofbands: Int(selectedType) ?? 0), unit: "Ω")
                                        Spacer()
                                    }
                                }
                                .frame(width: geometry.size.width / 2.6)
                                .contextMenu {
                                    Button {
                                        UIPasteboard.general.setValue(resistorValue + "Ω", forPasteboardType: "public.plain-text")
                                    } label: {
                                        Label("Copy Resistance", systemImage: "doc.on.doc")
                                    }

                                    Button {
                                        UIPasteboard.general.setValue(resistorTolerance + "± " + resistorTolerance + "Ω", forPasteboardType: "public.plain-text")
                                    } label: {
                                        Label("Copy Resistance with Absolute Tolerance", systemImage: "doc.on.doc")
                                    }
                                }

                            GroupBox(label: Label("Tolerance", systemImage: "plusminus")
                                .foregroundColor(.red)) {
                                    HStack {
                                        ValueView(value: returnTolerance(digit1: digit1, digit2: digit2, digit3: digit3, multiplier: multiplier, tolerance: tolerance, coefficient: coefficient, numofbands: Int(selectedType) ?? 0), unit: "Ω")
                                        Text("/").font(.system(size: 14, weight: .semibold, design: .rounded)).foregroundColor(.secondary)
                                        ValueView(value: returnTolerance(digit1: digit1, digit2: digit2, digit3: digit3, multiplier: multiplier, tolerance: tolerance, coefficient: coefficient, numofbands: Int(selectedType) ?? 0) * 100, unit: "%")
                                        Spacer()
                                    }
                                }
                                .contextMenu {
                                    Button {
                                        UIPasteboard.general.setValue(resistorTolerance, forPasteboardType: "public.plain-text")
                                    } label: {
                                        Label("Copy Tolerance", systemImage: "doc.on.doc")
                                    }
                                    Button {
                                        UIPasteboard.general.setValue(resistorTolerancePercentage, forPasteboardType: "public.plain-text")
                                    } label: {
                                        Label("Copy Percentage Tolerance", systemImage: "doc.on.doc")
                                    }
                                }
                        }
                        .padding(.vertical, 1)

                        GroupBox(label: Label("Temperature Coefficient",systemImage: "thermometer.high")
                            .foregroundColor(.orange)
                            ) {
                                HStack {
                                    ValueView(value: returnCoefficient(digit1: digit1, digit2: digit2, digit3: digit3, multiplier: multiplier, tolerance: tolerance, coefficient: coefficient, numofbands: Int(selectedType) ?? 0), unit: "ppm/k")
                                    Spacer()
                                }
                            }
                            .contextMenu {
                                Button {
                                    UIPasteboard.general.setValue(temperatureCoefficient, forPasteboardType: "public.plain-text")
                                } label: {
                                    Label("Copy Temperature Coefficient", systemImage: "doc.on.doc")
                                }
                            }

                        GroupBox(label: Text("Configure Resistor")
                            .foregroundColor(Color("dynamicFontColor"))) {
                                Picker("Choose resistor type", selection: $selectedType) {
                                    ForEach(resistorTypes, id: \.self) {
                                        Text($0)
                                    }
                                }
                                .pickerStyle(SegmentedPickerStyle())
                            }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationBarTitle("Decoder")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu {
                        Button(role: .destructive, action: {
                            digit1 = .white
                            digit2 = .white
                            digit3 = .white
                            multiplier = .white
                            tolerance = .brown
                            coefficient = .brown
                        }) {
                            Label("Reset Parameters", systemImage: "arrow.counterclockwise")
                        }
                        Button(action: {
                        }) {
                            Label("Send Feedback", systemImage: "exclamationmark.bubble")
                                .foregroundColor(.purple)
                        }
                        ShareLink(item: URL(string: url)!) {
                            Label("Share App", systemImage: "square.and.arrow.up")
                        }

                    } label: {
                        Image(systemName: "ellipsis.circle.fill")
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(Color("AccentColor"))
                            .font(.title2)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingSheet.toggle()
                    }
                        label: {
                        Label("Colour table", systemImage: "info.circle.fill")
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(Color("AccentColor"))
                            .font(.title2)
                    }
                    .sheet(isPresented: $showingSheet) {
                        NavigationStack {
                            SheetView()
                        }
                        .presentationDetents([.large])
                        .presentationDragIndicator(.visible)
                    }
                }
            }
            
            NavigationLink(destination: HistoryView()) {
                ZStack {
                    Rectangle()
                        .fill(Color("containerColor"))
                        .cornerRadius(8)
                        .frame(height: 52)
                        .padding(.horizontal)

                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
            .padding(.bottom)
        }
    }
}

struct ValueView: View {
    var value: Double
    var unit: String

    @ScaledMetric var size: CGFloat = 1

    @ViewBuilder var body: some View {
        HStack {
            if value > 1000 {
                Text(value.scientificFormatted)
                    .font(.system(size: 22 * size, weight: .bold, design: .rounded))

                    + Text(" \(unit)")
                    .font(.system(size: 14 * size, weight: .bold)).foregroundColor(.secondary)

            } else if value == 0 {
                Text("N/A")
                    .font(.system(size: 22 * size, weight: .bold, design: .rounded))

                    + Text(" \(unit)")
                    .font(.system(size: 14 * size, weight: .bold, design: .rounded)).foregroundColor(.secondary)

            } else {
                Text(String(format: "%.2f", value))
                    .font(.system(size: 22 * size, weight: .bold, design: .rounded))

                    + Text(" \(unit)")
                    .font(.system(size: 14 * size, weight: .bold, design: .rounded)).foregroundColor(.secondary)
            }
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}

struct ColoredGroupBox: GroupBoxStyle {
    @Environment(\.colorScheme) var colorScheme
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
        .background(RoundedRectangle(cornerRadius: 15, style: .continuous)
            .fill(colorScheme == .dark ? Color("AccentColor").opacity(0.9) : Color("AccentColor").opacity(0.5))
        )
    }
}

extension Formatter {
    static let scientific: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.positiveFormat = "0.###E+0"
        formatter.exponentSymbol = "e"
        return formatter
    }()
}

extension Numeric {
    var scientificFormatted: String {
        return Formatter.scientific.string(for: self) ?? ""
    }
}

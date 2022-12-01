//
//  ResClasses.swift
//  ResCode
//
//  Created by Nick Chen on 2022-10-27.
//

import Foundation
import SwiftUI
import Resistance

let digitValue: [Digit] = [.white, .black, .brown, .red, .orange, .yellow, .blue, .violet, .grey]
let multiplierValue: [Multiplier] = [.white, .black, .brown, .red, .orange, .yellow, .green, .blue, .violet, .grey, .gold, .silver]
let toleranceValue: [Tolerance] = [.brown, .red, .orange, .yellow, .green, .blue, .violet, .grey, .gold, .silver]
let coeffiecientValue: [Coefficient] = [.brown, .red, .orange, .yellow, .blue, .violet]

let resistorTypes = ["4", "5", "6"]


struct ColorType: Identifiable {
    
    var name: String
    var value: String
    var resistance: String
    var tolerance: String
    var TCR: String
    var id: Int
    
}


struct ResistorModel: Identifiable{
    var id: ObjectIdentifier
    var numofbands: Int
    var digit1: Digit
    var digit2: Digit
    var digit3: Digit
    var multiplier: Multiplier
    var tolerance: Tolerance
    var coefficient: Coefficient
    var value: Double
    var toleranceValue: Double
    var coefficientValue: Double
    
}

class ResistorData: ObservableObject {
    
    @Published var resistance: String
    @Published var selectedType: String
    @Published var coefficient: String
    @Published var tolerance: String
    
    init(resistance: String, selectedType: String, coefficient: String, tolerance: String) {
        self.resistance = resistance
        self.selectedType = selectedType
        self.coefficient = coefficient
        self.tolerance = tolerance
    }
}





//
//  ResFunctions.swift
//  ResCode
//
//  Created by Nick Chen on 2022-10-27.
//

import Foundation
import Resistance
import SwiftUI

func ColorIndex(color: String, type: String) -> Double {
    var value: Double = 0

    if type == "tolerance" {
        switch color {
        case "Brown":
            value = 1
            break
        case "Red":
            value = 2
            break
        case "Orange":
            value = 3
            break
        case "Yellow":
            value = 4
            break
        case "Green":
            value = 0.5
            break
        case "Blue":
            value = 0.25
            break
        case "Violet":
            value = 0.1
            break
        case "Gray":
            value = 0.05
            break
        case "Gold":
            value = 5
            break
        case "Silver":
            value = 10
            break
        case "Transparent":
            value = 20
            break
        default:
            break
        }
    } else {
        switch color {
        case "Black":
            value = 0
            break
        case "Brown":
            value = 1
            break
        case "Red":
            value = 2
            break
        case "Orange":
            value = 3
            break
        case "Yellow":
            value = 4
            break
        case "Green":
            value = 5
            break
        case "Blue":
            value = 6
            break
        case "Violet":
            value = 7
            break
        case "Grey":
            value = 8
            break
        case "White":
            value = 9
            break
        default:
            break
        }
    }
    return value
}

func changeColor(input: Any) -> Color {
    switch input {
    case Digit.black, Multiplier.black:
        return Color("Black")

    case Digit.brown, Multiplier.brown, Tolerance.brown, Coefficient.brown:
        return Color("Brown")

    case Digit.red, Multiplier.red, Tolerance.red, Coefficient.red:
        return Color("Red")

    case Digit.orange, Multiplier.orange, Tolerance.orange, Coefficient.orange:
        return Color("Orange")

    case Digit.yellow, Multiplier.yellow, Tolerance.yellow, Coefficient.yellow:
        return Color("Yellow")

    case Digit.green, Multiplier.green, Tolerance.green:
        return Color("Green")

    case Digit.blue, Multiplier.blue, Tolerance.blue, Coefficient.blue:
        return Color("Blue")

    case Digit.violet, Multiplier.violet, Tolerance.violet, Coefficient.violet:
        return Color("Violet")

    case Digit.grey, Multiplier.grey, Tolerance.grey:
        return Color("Grey")

    case Digit.white, Multiplier.white:
        return Color.white

    case Multiplier.gold, Tolerance.gold:
        return Color("Gold")

    case Multiplier.silver, Tolerance.silver:
        return Color("Silver")

    default:
        return Color.white
    }
}

func colorToText(input: Any) -> String {
    switch input {
    case Digit.black, Multiplier.black:
        return "Black"

    case Digit.brown, Multiplier.brown, Tolerance.brown, Coefficient.brown:
        return "Brown"

    case Digit.red, Multiplier.red, Tolerance.red, Coefficient.red:
        return "Red"

    case Digit.orange, Multiplier.orange, Tolerance.orange, Coefficient.orange:
        return "Orange"

    case Digit.yellow, Multiplier.yellow, Tolerance.yellow, Coefficient.yellow:
        return "Yellow"

    case Digit.green, Multiplier.green, Tolerance.green:
        return "Green"

    case Digit.blue, Multiplier.blue, Tolerance.blue, Coefficient.blue:
        return "Blue"

    case Digit.violet, Multiplier.violet, Tolerance.violet, Coefficient.violet:
        return "Violet"

    case Digit.grey, Multiplier.grey, Tolerance.grey:
        return "Grey"

    case Digit.white, Multiplier.white:
        return "White"

    case Multiplier.gold, Tolerance.gold:
        return "Gold"

    case Multiplier.silver, Tolerance.silver:
        return "Silver"

    default:
        return "None"
    }
}

func changeColorSheet(input: String) -> Color {
    switch input {
    case "Black":
        return Color("Black")

    case "Brown":
        return Color("Brown")

    case "Red":
        return Color("Red")

    case "Orange":
        return Color("Orange")

    case "Yellow":
        return Color("Yellow")

    case "Green":
        return Color("Green")

    case "Blue":
        return Color("Blue")

    case "Violet":
        return Color("Violet")

    case "Grey":
        return Color("Grey")

    case "White":
        return Color.white

    case "Gold":
        return Color("Gold")

    case "Silver":
        return Color("Silver")

    default:
        return Color.white
    }
}

func changeFontColor(input: Any) -> Color {
    switch input {
    case Digit.white, Multiplier.white, Multiplier.silver, Tolerance.silver:
        return Color.black
    default:
        return Color.white
    }
}

func changeFontColorSheet(input: String) -> Color {
    switch input {
    case "Black":
        return Color.white
    default:
        return Color.black
    }
}

func returnResistance(digit1: Digit, digit2: Digit, digit3: Digit, multiplier: Multiplier, tolerance: Tolerance, coefficient: Coefficient, numofbands: Int) -> Double {
    switch numofbands {
    case 4:

        let fourBand = FourBandResistor(digit1: digit1, digit2: digit2, multiplier: multiplier, tolerance: tolerance)
        return fourBand.value

    case 5:

        let fiveBand = FiveBandResistor(digit1: digit1, digit2: digit2, digit3: digit3, multiplier: multiplier, tolerance: tolerance)
        return fiveBand.value

    case 6:

        let sixBand = SixBandResistor(digit1: digit1, digit2: digit2, digit3: digit3, multiplier: multiplier, tolerance: tolerance, coefficient: coefficient)
        return sixBand.value

    default:
        return 0
    }
}

func returnTolerance(digit1: Digit, digit2: Digit, digit3: Digit, multiplier: Multiplier, tolerance: Tolerance, coefficient: Coefficient, numofbands: Int) -> Double {
    switch numofbands {
    case 4:

        let fourBand = FourBandResistor(digit1: digit1, digit2: digit2, multiplier: multiplier, tolerance: tolerance)
        return fourBand.tolerance.rawValue

    case 5:

        let fiveBand = FiveBandResistor(digit1: digit1, digit2: digit2, digit3: digit3, multiplier: multiplier, tolerance: tolerance)
        return fiveBand.tolerance.rawValue

    case 6:

        let sixBand = SixBandResistor(digit1: digit1, digit2: digit2, digit3: digit3, multiplier: multiplier, tolerance: tolerance, coefficient: coefficient)
        return sixBand.tolerance.rawValue

    default:
        return 0
    }
}

func returnCoefficient(digit1: Digit, digit2: Digit, digit3: Digit, multiplier: Multiplier, tolerance: Tolerance, coefficient: Coefficient, numofbands: Int) -> Double {
    switch numofbands {
    case 6:

        let sixBand = SixBandResistor(digit1: digit1, digit2: digit2, digit3: digit3, multiplier: multiplier, tolerance: tolerance, coefficient: coefficient)
        return sixBand.coefficient.rawValue

    default:
        return 0
    }
}



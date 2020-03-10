import Foundation
import SwiftUI

class Count{
    
    func secondCount(nominalFirstValue: Int, secondValue: Double, firstValue: Double, secondValute: String, nominalSecondValue: Int) -> String {
        
        if nominalFirstValue >= 10 {
            let secondNominalValue = (secondValue / firstValue) * Double(nominalFirstValue)
            if secondValute == ""{}
            else{
                let finalValue = Double(secondValute)! * secondNominalValue
                if finalValue < 1{
                    let rounded = round(finalValue * 10000) / 10000
                    return String(rounded)
                }
                else{
                    let rounded = round(finalValue * 100) / 100
                    return String(rounded)
                }
            }
        }
        else{
            let secondNominalValue = (secondValue / firstValue) / Double(nominalSecondValue)
            if secondValute == "" {}
            else{
                let finalValue = Double(secondValute)! * secondNominalValue
                if finalValue < 1{
                    let rounded = round(finalValue * 10000) / 10000
                    return String(rounded)
                }
                else{
                    let rounded = round(finalValue * 100) / 100
                    return String(rounded)
                }
            }
        }
        return ""
    }

    func firstCount(nominalFirstValue: Int, secondValue: Double, firstValue: Double, firstValute: String, nominalSecondValue: Int) -> String {
        
        if nominalSecondValue >= 10{
            let firstNominalvalue = (firstValue / secondValue) * Double(nominalSecondValue)
            if firstValute == ""{}
            else{
                let finalValue = Double(firstValute)! * firstNominalvalue
                if finalValue < 0 {
                    let rounded = round(finalValue * 10000) / 10000
                    return String(rounded)
                }
                else{
                    let rounded = round(finalValue * 100) / 100
                    return String(rounded)
                }
            }
        }else{
            let firstNominalValue = (firstValue / secondValue) / Double(nominalFirstValue)
            if firstValute == ""{}
            else{
                let finalValue = Double(firstValute)! * firstNominalValue
                if finalValue < 1{
                    let rounded = round(finalValue * 10000) / 10000
                    return String(rounded)
                }
                else{
                    let rounded = round(finalValue * 100) / 100
                    return String(rounded)
                }
            }
        }
        return ""
    }
}

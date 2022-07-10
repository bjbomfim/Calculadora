//
//  CalculadoraHelper.swift
//  Calculadora
//
//  Created by Alexandre Bomfim on 16/06/22.
//

import Foundation

struct CalculadoraHelper {
//    static func verificaNumber(verifyChar:String) -> String{
//        if verifyChar.count != 0{
//            let lastChar = verifyChar.last
//            if let _: Bool = lastChar?.isNumber {
//                return verifyChar + ","
//            }
//        }
//        return "0,"
//    }
//
//    static func verifyOperator(valor: String) -> Character{
//        var operador = Character(" ")
//        Constants.allCases.forEach{
//            constOperador in
//            if valor.contains(constOperador.rawValue){
//                operador = constOperador.rawValue
//            }
//        }
//        return operador
//    }
//
//    static func sliceString(valor: String, indexOf: Character) ->  [String]{
//        let indexValor = valor.firstIndex(of: indexOf)!
//        let startOfValor = valor.prefix(upTo: indexValor)
//        let finalOfValor = valor.suffix(from: indexValor)
//        let arrayValor: [String] = [String(startOfValor), String(finalOfValor.dropFirst())]
//        return arrayValor
//    }
    
    static func verifyFloat(valor:String) -> Bool{
        let indexValor = valor.firstIndex(of: ".")!
        let finalOfValor = valor.suffix(from: indexValor)
        var finalOfValor2 = finalOfValor.replacingOccurrences(of: "0", with: "")
        let _ = finalOfValor2.removeFirst()
        if finalOfValor2.isEmpty {
            return false
        }
        else{
            return true
        }
    }
    
    static func countFloat(valor:String) -> Int{
        let indexValor = valor.firstIndex(of: ".")!
        var finalOfValor = valor.suffix(from: indexValor)
        let _ = finalOfValor.removeFirst()
        if finalOfValor == "0" {
            return 1
        }
        return finalOfValor.count+1
    }
    
    static func calculaValor(valor1: Double, valor2: Double, sinal: Character) -> Double{
        var calculado: Double = 0
        switch sinal{
            case Constants.soma.rawValue: calculado = valor1 + valor2
            case Constants.subtracao.rawValue: calculado = valor1 - valor2
            case Constants.multiplicacao.rawValue: calculado = valor1 * valor2
            default: calculado = valor1 / valor2
        }
        return (calculado*100).rounded()/100
    }
    
    static func pow10(valor1: Int) -> Double{
        return pow(Double(10), Double(valor1))
    }
    
    static func x2(valor1: Double) -> Double{
        return pow(valor1, 2)
    }
    
    static func raiz(valor1: Double) -> Double{
        return sqrt(valor1)
    }
    
    static func porcent(valor1: Double) -> Double{
        return valor1/100
    }
}

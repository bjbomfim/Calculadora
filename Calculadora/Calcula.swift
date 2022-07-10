//
//  Calcula.swift
//  Calculadora
//
//  Created by Alexandre Bomfim on 16/06/22.
//

import Foundation

class Calcula: ObservableObject {
    private var valorInicial:Double = 0
    @Published var valor:String = "0"
    @Published var valor2:String = ""
    private var valorFinal:Double = 0
    private var calculaOn:Bool = false
    private var virgulaOn:Bool = false
    private var operation:Character = Character(" ")
    
    func funcaoValorBotao(value: String){
        switch value {
            case "C": self.reset()
            case ",": self.virgula()
            case "=": self.calc()
            case "+" , "-" , "/" , "*": self.operation(Character(value))
            case "x²": self.x2()
            case "%": self.porcent()
            case "√": self.raiz()
            default: self.putValue(value: value)
        }
        
    }
    
    private func reset(){
        self.valorInicial = 0
        self.valorFinal = 0
        self.valor = "0"
        self.valor2 = ""
        self.operation = " "
        self.calculaOn = false
        self.virgulaOn = false
    }
    
    private func x2(){
        if self.calculaOn && self.valorFinal != 0{
            self.valorFinal = CalculadoraHelper.x2(valor1: self.valorFinal)
            self.daValor2(self.valorFinal)
        }else if !self.calculaOn{
            self.valorInicial = CalculadoraHelper.x2(valor1: self.valorInicial)
            self.daValor(self.valorInicial)
        }
    }
    
    private func raiz(){
        if self.calculaOn && self.valorFinal != 0{
            self.valorFinal = CalculadoraHelper.raiz(valor1: self.valorFinal)
            self.daValor2(self.valorFinal)
        }else if !self.calculaOn{
            self.valorInicial = CalculadoraHelper.raiz(valor1: self.valorInicial)
            self.daValor(self.valorInicial)
        }
    }
    
    private func putValue(value: String){
        if self.calculaOn{
            self.valorFinal = self.newValue(self.valorFinal, value)
            self.daValor2(self.valorFinal)
        }else{
            self.valorInicial = self.newValue(self.valorInicial, value)
            self.daValor(self.valorInicial)
        }
    }
    
    private func newValue(_ value: Double, _ valueButton: String) -> Double{
        var new:Double
        if self.virgulaOn {
            let strlen = String(value)
            let valorPow = CalculadoraHelper.pow10(valor1: CalculadoraHelper.countFloat(valor: strlen))
            let valueBtDouble = Double(valueButton)!
            if value != 0{
                new = ((value + valueBtDouble/valorPow)*1000).rounded()/1000
            }else{
                new = 0
            }
        }else{
            if value != 0{
                new = value * 10 + Double(valueButton)!
            }else if value == 0{
                new = Double(valueButton)!
            }else{
                new = 0
            }
        }
        return new
    }
    
    private func daValor(_ valorDouble: Double) {
        let temp = String(valorDouble)
        if self.virgulaOn || CalculadoraHelper.verifyFloat(valor: temp){
            self.valor = String(valorDouble)
        }else{
            self.valor = String(Int(valorDouble))
        }
        
    }
    
    private func daValor2(_ valorDouble: Double) {
        if self.virgulaOn{
            self.valor2 = String(valorDouble)
        }else{
            self.valor2 = String(Int(valorDouble))
        }
    }
    
    private func calc() {
        if self.calculaOn && self.valorFinal != 0 {
            self.valorInicial = CalculadoraHelper.calculaValor(valor1: self.valorInicial, valor2: self.valorFinal, sinal: self.operation)
            self.operation = " "
            self.calculaOn = false
            self.daValor(self.valorInicial)
            self.valor2 = ""
            self.valorFinal = 0
        }
    }
    
    private func virgula() {
        if self.calculaOn && !self.virgulaOn{
            self.valor2 += ","
        }else if !self.virgulaOn{
            self.valor += ","
        }
        self.virgulaOn = true
    }
    
    private func porcent(){
        if self.calculaOn && self.valorFinal != 0{
            self.valorFinal = CalculadoraHelper.porcent(valor1: self.valorFinal)
            self.daValor2(self.valorFinal)
        }else if !self.calculaOn{
            self.valorInicial = CalculadoraHelper.porcent(valor1: self.valorInicial)
            self.daValor(self.valorInicial)
        }
    }
    
    private func operation(_ value: Character){
        if self.calculaOn {
            if self.valorFinal != 0{
                self.valorInicial = CalculadoraHelper.calculaValor(valor1: self.valorInicial, valor2: self.valorFinal, sinal: self.operation)
                self.operation = value
                self.daValor(self.valorInicial)
                self.valor += String(value)
                self.valor2 = ""
                self.valorFinal = 0
            }else{
                self.daValor(self.valorInicial)
                self.valor += String(value)
                self.operation = value
            }
            self.virgulaOn = false
        }else{
            self.operation = value
            self.valor += String(value)
            self.calculaOn = true
            self.virgulaOn = false
        }
    }
}

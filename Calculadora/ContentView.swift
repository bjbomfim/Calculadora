//
//  ContentView.swift
//  Calculadora
//
//  Created by Alexandre Bomfim on 21/03/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
        
    @StateObject var valor: Calcula = Calcula()
    var body: some View {
        let color:Color = {
            let color = colorScheme == .dark ? Color.pink : Color.blue
            return color
        }()
        VStack{
            Text(valor.valor + valor.valor2)
                .font(.system(size: 45, weight: .light, design: .serif))
                .foregroundColor(color)
            HStack{
                VStack{
                    //---------------------------------------
                    Botao(digito: "C", funcao: valor.funcaoValorBotao)
                    Botao(digito: "7", funcao: valor.funcaoValorBotao)
                    Botao(digito: "4", funcao: valor.funcaoValorBotao)
                    Botao(digito: "1", funcao: valor.funcaoValorBotao)
                    Botao(digito: "0", funcao: valor.funcaoValorBotao)
                    
                }.frame(width: 85, height: 500, alignment: .bottom)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                VStack{
                    //---------------------------------------
                    Botao(digito: "√", funcao: valor.funcaoValorBotao)
                    Botao(digito: "8", funcao: valor.funcaoValorBotao)
                    Botao(digito: "5", funcao: valor.funcaoValorBotao)
                    Botao(digito: "2", funcao: valor.funcaoValorBotao)
                    Botao(digito: "x²", funcao: valor.funcaoValorBotao)
                }.frame(width: 85, height: 500, alignment: .bottom)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                VStack{
                    //---------------------------------------
                    Botao(digito: "%", funcao: valor.funcaoValorBotao)
                    Botao(digito: "9", funcao: valor.funcaoValorBotao)
                    Botao(digito: "6", funcao: valor.funcaoValorBotao)
                    Botao(digito: "3", funcao: valor.funcaoValorBotao)
                    Botao(digito: ",", funcao: valor.funcaoValorBotao)
                }.frame(width: 85, height: 500, alignment: .bottom)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                VStack{
                    //---------------------------------------
                    Botao(digito: "/", funcao: valor.funcaoValorBotao)
                    Botao(digito: "*", funcao: valor.funcaoValorBotao)
                    Botao(digito: "-", funcao: valor.funcaoValorBotao)
                    Botao(digito: "+", funcao: valor.funcaoValorBotao)
                    Botao(digito: "=", funcao: valor.funcaoValorBotao)
                }.frame(width: 85, height: 500, alignment: .bottom)
                    .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }.frame(width: 400, height: 700, alignment: .bottom)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView().preferredColorScheme(.dark)
        }
    }
}

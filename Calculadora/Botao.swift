//
//  Botao.swift
//  Calculadora
//
//  Created by Alexandre Bomfim on 25/03/22.
//

import SwiftUI

struct Botao: View {
    @Environment(\.colorScheme) var colorScheme
    var color:Color = Color(#colorLiteral(red: 0.205622375, green: 0.1203870252, blue: 0.1129466519, alpha: 1))
    let digito:String
    let funcao:(_ valor: String) -> ()
    var body: some View {
        ZStack {
            Button(action: {
                funcao(digito)
            }){
                Text(digito)
                    .foregroundColor(colorScheme == .dark ? Color.pink : Color.blue)
                    .font(.system(size: 45, weight: .light, design: .serif))
            }.frame(width: 80, height: 80, alignment: .center)
                .foregroundColor(.white)
                .background(colorScheme == .dark ? color : Color.clear)
                .cornerRadius(100)
                
            
        }
    }
}

struct Botao_Previews: PreviewProvider {
    static var previews: some View {
        Botao(digito: "0") { (valor) in
            valor
        }
    }
}

//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Juliano Santos on 30/01/22.
//

import UIKit

class Refeicao: NSObject {
    
    let nome: String
    let felicidade: Int
    var itens: Array<Item> = []
    
    init(nome: String, felicidade: Int, itens: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }
    
    func totalCalorias() -> Double {
        var total = 0.00
        for item in itens {
            total += item.calorias
        }
        return total
    }

}

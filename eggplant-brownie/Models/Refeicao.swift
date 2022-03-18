//
//  Refeicao.swift
//  eggplant-brownie
//
//  Created by Juliano Santos on 30/01/22.
//

import UIKit

class Refeicao: NSObject, NSCoding {
    
    let nome: String
    let felicidade: Int
    var itens: Array<Item> = []
    
    init(nome: String, felicidade: Int, itens: [Item] = []) {
        self.nome = nome
        self.felicidade = felicidade
        self.itens = itens
    }

    
    // MARK: -- NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(nome, forKey: "nome")
        aCoder.encode(felicidade, forKey: "felicidade")
        aCoder.encode(itens, forKey: "itens")
    }
    
    required init?(coder aDecoder: NSCoder) {
        nome = aDecoder.decodeObject(forKey: "nome") as! String
        felicidade = aDecoder.decodeInteger(forKey: "felicidade")
        itens = aDecoder.decodeObject(forKey: "itens") as! Array<Item>
    }
    
    
    // MARK: -- Metodos
    
    func totalCalorias() -> Double {
        var total = 0.00
        for item in itens {
            total += item.calorias
        }
        return total
    }
    
    func detalhes() -> String {
        var mensagem = "Felicidade: \(felicidade)"
        for item in itens {
            mensagem += ", \(item.nome) - calorias: \(item.calorias)"
        }
        return mensagem
    }

}

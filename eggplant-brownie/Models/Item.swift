//
//  Item.swift
//  eggplant-brownie
//
//  Created by Juliano Santos on 30/01/22.
//

import UIKit

class Item: NSObject {
    
    let nome: String
    let calorias: Double
    
    init(nome: String, calorias: Double) {
        self.nome = nome
        self.calorias = calorias
    }

}

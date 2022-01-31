import UIKit
import CoreFoundation



/*
 // trabalhando com metos, arrays em classe
 
class Pedido {
    var nome: String
    var data: String
    var itens: Array<Item> = []
    
    init(nome: String, data: String) {
        self.nome = nome
        self.data = data
    }
    
    func valorTotalPedido() -> Double {
        var total = 0.00
        for item in itens {
            total += item.valor
        }
        return total
    }
}


class Item {
    var descricao: String
    var valor: Double
    
    init(descricao: String, valor: Double) {
        self.descricao = descricao
        self.valor = valor
    }
}

let pedido = Pedido(nome: "Juliano", data: "30/01/2022")

let item1 = Item(descricao: "Bateria Ordery", valor: 6000.00)
let item2 = Item(descricao: "Kit Cymbals Serie K", valor: 8000.00)
let item3 = Item(descricao: "Banco Gibraltar", valor: 900.00)

pedido.itens.append(item1)
pedido.itens.append(item2)
pedido.itens.append(item3)


print(pedido.nome)
print(pedido.valorTotalPedido())
print(pedido.itens.first?.descricao)
*/

/* // Metedos que retornam opcionais

var numero = Int("4")
if let x = numero {
    print(x)
}
*/


/* // if let | guard let
class Produto {
    var nome: String?
}

var produto = Produto()
//produto.nome = "Pitaia"

// má prática de unwrap
//print(produto.nome!)

if let nomeProduto = produto.nome {
    print(nomeProduto)
}

func showNameProduct() {
    guard let nomeProduto = produto.nome else {
        print("Variavel vazia")
        return
    }
    print(nomeProduto)
}

showNameProduct()
*/


/* - criando classe com atributos optionals
   - instanciando classe
   - força desenvelopamento de atributos (forced unwrap)
 
class Produto {
    var id: Int?
    var descricao: String?
    var valor: Double?
    var quantidade: Int?
    var unidade: String?
}

let produto = Produto()
produto.id = 1
produto.descricao = "Batata"
produto.quantidade = 999
produto.valor = 4.98
produto.unidade = "KG"

print(produto.descricao!)
*/


// funcoes com arrays como parametros
/*
let totalDeCalorias = [34, 564.56, 443, 678]
func totalDeCalorias(totalDeCalorias: [Double]) -> Double {
    var total = 0.00
    
    for caloria in totalDeCalorias {
       total += caloria
    }
    
    return total
}
print(totalDeCalorias(totalDeCalorias: totalDeCalorias))
*/



// Criando e percorrendo listas [array]
/*
let numbers = ["11","22","33","44","55","66","77","88","99","90"]

for i in 0...numbers.count-1 {
    print(numbers[i])
}

for number in numbers {
    print(number)
}
*/



// Criando funcoes
/*
     let valor: Double = 55.9
     let quantidade = 54
     let descricaoLonga: String = "Batata Palha Abrasileirada"
     let descricaoCurta = "Batata Palha"
     let isPromocional: Bool = true

    func showDescricao(valorProduto: Double, quantidadeProduto: Int, descricao: String, promocional: Bool ) {
        print("\(descricao) ,\(quantidadeProduto) por \(valorProduto) : \(promocional) ")
    }

    showDescricao(valorProduto: valor, quantidadeProduto: quantidade, descricao: descricaoLonga, promocional: isPromocional)

    func showDescricao(_ valorProduto: Double, _ quantidadeProduto: Int, _ descricao: String, _ promocional: Bool ) {
        print("\(descricao) ,\(quantidadeProduto) por \(valorProduto) : \(promocional) ")
    }

    showDescricao(valor, quantidade, descricaoLonga, isPromocional)
*/


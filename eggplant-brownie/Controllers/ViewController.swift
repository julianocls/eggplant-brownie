//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Juliano Santos on 23/01/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    @IBAction func adicionar(_ sender: Any) {

//        if let nomeDaRefeicao = nomeTextField?.text, let felicidadeDaRefeicao = felicidadeTextField?.text {
//            let nome = nomeDaRefeicao
//            if let felicidade = Int(felicidadeDaRefeicao) {
//                print("Comi \(nome) e fiquei com felicidade \(felicidade)")
//                let refeicao = Refeicao(nome: nome, felicidade: felicidade)
//            } else {
//                print("Erro ao criar refeicao")
//            }
//        }
        
        guard let nome = nomeTextField?.text else {
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            print("Deu ruim ao tentar criar refeicao por causa do campo felicidade")
            return
        }

        print("Comi \(nome) e fiquei com felicidade \(felicidade)")
        let refeicao = Refeicao(nome: nome, felicidade: felicidade)
    }
    
}


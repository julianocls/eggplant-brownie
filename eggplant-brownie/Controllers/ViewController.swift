//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Juliano Santos on 23/01/22.
//

import UIKit

protocol AdicionaRefeicaoDelegate {
    func add(_ refeicao: Refeicao)
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
   
    // MARK: - Attributes
    
    var delegate: AdicionaRefeicaoDelegate?
    let ingredientes = ["Mulho Sugo", "Molho Quatro Queijos", "Molho Vermelho", "Tempero", "Oregano", "Pimenta Calabresa", "Ameixa Seca", "Tomate Seco", "Bacon", "Mussarela", "Azeitona", "Palmito", "Presunto", "Calabresa", "Queijo Ralado"]
    
    // MARK: - IBOutlet
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    // MARK: - Actions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let ingrediente = ingredientes[indexPath.row]
        celula.textLabel?.text = ingrediente
        return celula
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        
        if celula.accessoryType == .none {
            celula.accessoryType = .checkmark
        } else {
            celula.accessoryType = .none
        }
            
    }
    
    
    @IBAction func adicionar(_ sender: Any) {

        /*if let nomeDaRefeicao = nomeTextField?.text, let felicidadeDaRefeicao = felicidadeTextField?.text {
            let nome = nomeDaRefeicao
            if let felicidade = Int(felicidadeDaRefeicao) {
                print("Comi \(nome) e fiquei com felicidade \(felicidade)")
                let refeicao = Refeicao(nome: nome, felicidade: felicidade)
            } else {
                print("Erro ao criar refeicao")
            }
        }*/
        
        guard let nome = nomeTextField?.text else {
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            print("Deu ruim ao tentar criar refeicao por causa do campo felicidade")
            return
        }

        print("Comi \(nome) e fiquei com felicidade \(felicidade)")
        let refeicao = Refeicao(nome: nome, felicidade: felicidade)
        
        delegate?.add(refeicao)
        
        navigationController?.popViewController(animated: true)
    }
    
}


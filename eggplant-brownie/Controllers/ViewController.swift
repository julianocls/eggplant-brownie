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

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AdicionaItensDelegate {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var itensTableView: UITableView!
    
   
    // MARK: - Attributes
    
    var delegate: AdicionaRefeicaoDelegate?
    /*let ingredientes = ["Mulho Sugo", "Molho Quatro Queijos", "Molho Vermelho", "Tempero", "Oregano", "Pimenta Calabresa", "Ameixa Seca", "Tomate Seco", "Bacon", "Mussarela", "Azeitona", "Palmito", "Presunto", "Calabresa", "Queijo Ralado"]*/
    var itens: [Item] = [
        Item(nome: "Molho Vermelho", calorias: 40.00),
        Item(nome: "Molho Branco", calorias: 40.00),
        Item(nome: "Molho 4 Queijos", calorias: 40.00),
        Item(nome: "Molho Apimentado", calorias: 40.00)
    ]
    
    var itensSelecionados: [Item] = []
    
    // MARK: - IBOutlet
    
    @IBOutlet var nomeTextField: UITextField?
    @IBOutlet weak var felicidadeTextField: UITextField?
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        let botaoAdicionar = UIBarButtonItem(
            title: "Adicionar",
            style: .plain,
            target: self,
            action: #selector(adicionarItem)
        )
        navigationItem.rightBarButtonItem = botaoAdicionar
    }
    
    @objc func adicionarItem() {
        let adicionarItensViewController = AdicionarItensViewController(delegate: self)
        navigationController?.pushViewController(adicionarItensViewController, animated: true)        
    }
    
    func add(_ item: Item) {
        itens.append(item)
        if let tableView = itensTableView {
            tableView.reloadData()
        } else {
            let alert = UIAlertController(title: "Desculpe!", message: "Não foi possível atualizar a tabela!", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
    }
    
    // MARK: - Actions
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let ingrediente = itens[indexPath.row]
        celula.textLabel?.text = ingrediente.nome
        return celula
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let celula = tableView.cellForRow(at: indexPath) else { return }
        
        let item = itens[indexPath.row]
        if celula.accessoryType == .none {
            celula.accessoryType = .checkmark
            itensSelecionados.append(item)
        } else {
            celula.accessoryType = .none
            if let position = itensSelecionados.firstIndex(of: item) {
                itensSelecionados.remove(at: position)
            }
        }
        /*for item in itensSelecionados { print(item.nome) }*/
    }
    
    
    @IBAction func adicionar(_ sender: Any) {
        
        guard let nome = nomeTextField?.text else {
            return
        }
        
        guard let felicidadeDaRefeicao = felicidadeTextField?.text, let felicidade = Int(felicidadeDaRefeicao) else {
            print("Deu ruim ao tentar criar refeicao por causa do campo felicidade")
            return
        }

        print("Comi \(nome) e fiquei com felicidade \(felicidade)")
        let refeicao = Refeicao(nome: nome, felicidade: felicidade, itens: itensSelecionados)
        
        delegate?.add(refeicao)
        
        navigationController?.popViewController(animated: true)
    }
    
}


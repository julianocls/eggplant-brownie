//
//  RefeicaoViewController.swift
//  eggplant-brownie
//
//  Created by Juliano Santos on 02/02/22.
//

import UIKit

class RefeicoesTableViewController: UITableViewController, AdicionaRefeicaoDelegate {
    
    var refeicoes = [Refeicao(nome: "Churrasco", felicidade: 5),
                     Refeicao(nome: "X-Tudo", felicidade: 3),
                     Refeicao(nome: "Subway", felicidade: 4)]
    
    override func viewDidLoad() {        
        guard let caminho = recuperaDiretorio() else { return }
        do {
            let dados = try Data(contentsOf: caminho)
            guard let refeicoesSalvas = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(dados) as? Array<Refeicao> else { return }
            refeicoes = refeicoesSalvas
        } catch {
            print(error.localizedDescription)
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return refeicoes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celula = UITableViewCell(style: .default, reuseIdentifier: nil)
        let refeicao = refeicoes[indexPath.row]
        celula.textLabel?.text = refeicao.nome
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(mostraDetalhes(_:)))
        celula.addGestureRecognizer(longPress)
        
        return celula
    }
    
    @objc func mostraDetalhes(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let celula = gesture.view as! UITableViewCell
            guard let indexPath = tableView.indexPath(for: celula) else {return}
            let refeicao = refeicoes[indexPath.row]

            RemoverRefeicaoViewController(controller: self)
                .exibe(refeicao, handler: { alert in
                           self.refeicoes.remove(at: indexPath.row)
                           self.tableView.reloadData()
            })
            
        }
    }
      
    func add(_ refeicao: Refeicao) {
        refeicoes.append(refeicao)
        
        guard let caminho = recuperaDiretorio() else { return }
        do {
            let dados = try NSKeyedArchiver.archivedData(withRootObject: refeicoes, requiringSecureCoding: false)
            try dados.write(to: caminho)
        } catch {
            print(error.localizedDescription)
        }
        
        tableView.reloadData()
    }
    
    func recuperaDiretorio() -> URL? {
        guard let diretorio = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        let caminho = diretorio.appendingPathComponent("refeicao")
        return caminho
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "adicionar" {
            if let viewController = segue.destination as? ViewController {
                viewController.delegate = self
            }
        }
    }
    
}

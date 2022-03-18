//
//  RemoverRefeicaoViewController.swift
//  eggplant-brownie
//
//  Created by Juliano Santos on 17/3/22.
//

import UIKit

class RemoverRefeicaoViewController {
    
    let controller: UIViewController
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(_ refeicao: Refeicao, handler: @escaping (UIAlertAction) -> Void) {
                
        let alerta = UIAlertController(title: refeicao.nome, message: refeicao.detalhes(), preferredStyle: .alert)
        let botaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel)
        alerta.addAction(botaoCancelar)
        
        let botaoRemover = UIAlertAction(title: "remover", style: .destructive, handler: handler)
        alerta.addAction(botaoRemover)
        
        controller.present(alerta, animated: true, completion: nil)

    }
    
}

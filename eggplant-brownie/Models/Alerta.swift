//
//  Alerta.swift
//  eggplant-brownie
//
//  Created by Juliano Santos on 5/3/22.
//

import UIKit

class Alerta {
    
    let controller: UIViewController
    
    init(controller: UIViewController) {
        self.controller = controller
    }
    
    func exibe(titulo: String = "Atenção", mensagem: String) {
        let alert = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alert.addAction(ok)
        controller.present(alert, animated: true, completion: nil)
    }
    
}

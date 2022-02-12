//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Juliano Santos on 2/6/22.
//

import UIKit

class AdicionarItensViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var caloriasTextField: UITextField!
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func adicionarItem(_ sender: Any) {
        guard let nome = nomeTextField?.text, let calorias = caloriasTextField?.text else {
            return
        }
        
        if let numeroCalorias = Double(calorias) {
            let item =Item(nome: nome, calorias: numeroCalorias)
            navigationController?.popViewController(animated: true)
        }
        
    }
    

}

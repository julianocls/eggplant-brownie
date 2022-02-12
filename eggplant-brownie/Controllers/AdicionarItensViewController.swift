//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Juliano Santos on 2/6/22.
//

import UIKit

protocol AdicionaItensDelegate {
    func add(_ item: Item)
}

class AdicionarItensViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var caloriasTextField: UITextField!
    
    // MARK: - attributes
    
    var delegate: AdicionaItensDelegate?
    
    init(delegate: AdicionaItensDelegate) {
        super.init(nibName: "AdicionarItensViewController", bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func adicionarItem(_ sender: Any) {
        guard let nome = nomeTextField?.text, let calorias = caloriasTextField?.text else {
            return
        }
        
        if let numeroCalorias = Double(calorias) {
            let item = Item(nome: nome, calorias: numeroCalorias)
            delegate?.add(item)
            navigationController?.popViewController(animated: true)
        }
    }
}

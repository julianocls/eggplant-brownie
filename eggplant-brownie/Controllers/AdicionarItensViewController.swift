//
//  AdicionarItensViewController.swift
//  eggplant-brownie
//
//  Created by Juliano Santos on 2/6/22.
//

import UIKit

class AdicionarItensViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func adicionarItem(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

}

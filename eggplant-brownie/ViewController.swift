//
//  ViewController.swift
//  eggplant-brownie
//
//  Created by Juliano Santos on 23/01/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nomeTextField: UITextField!
    @IBOutlet weak var felicidadeTextField: UITextField!
    
    @IBAction func adicionar(_ sender: Any) {
        
        let nome = nomeTextField.text
        let felicidade = felicidadeTextField.text
        
        print("Comi \(nome) e fiquei com felicidade \(felicidade)")
    }
    
}


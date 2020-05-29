//
//  CalculatorViewController.swift
//  what
//
//  Created by Florian Chauvain on 29/05/2020.
//  Copyright © 2020 Florian Chauvain. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    // On enregistre chaque élément ctrl et slide
    @IBOutlet weak var additionLabel: UILabel!
    @IBOutlet weak var pourboireLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var typeOfMoney: UISegmentedControl!
    
    // Le slider on le reprend une deuxime fois pour faire l'action
    @IBAction func ActionSlider(_ sender: UISlider) {
        updateDisplay()
        // On doit l'appeller ici vu que la fonction va s'activer à chaque changement dans le slider (c'est comme ça qu'on va récupérer les infos)
    }
    
    // Et le pour le changement de type de monnaie
    @IBAction func ActionMoneyChanger(_ sender: UISegmentedControl) {
        // C'est ici qu'on met si c'est euro ou dollar
        if sender.selectedSegmentIndex == 0 {
            currentieSign = "€"
        } else {
            currentieSign = "$"
        }
        
        // On appelle encore le updateDIsplay
        updateDisplay()
    }
    
    
    // On définit le taux de pourboire
    let tauxDuPourboire:Double = 0.12 // 12% de pourboire
    
    // On créer la variable de la monnaie
    var currentieSign:String = "€"
    
    // On créer la fonction qui va se charger de récupérer dans le sldier et changer les infos
    func updateDisplay() {
        // on récupère la valeur de montant
        let montantAddition = slider.value
        // on récupère slider et on prend la value
        
        // Puis on définit le montant du pourboire
        // On doit convertir le montant de l'addition avec double sinon cata
        let montantPourboire = Double(montantAddition) * tauxDuPourboire
        
        pourboireLabel.text = String(Int(montantPourboire)) + " " + currentieSign
        // On converti en entier pour que ça soit plus lisible + le signe concatener
        additionLabel.text = String(Int(montantAddition)) + " " + currentieSign
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // On appelle la fonction
        updateDisplay()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  RulesViewController.swift
//  Alias - Swift Maraphon 4
//
//  Created by Artem Solovev on 27.07.2022.
//

import UIKit

class RulesViewController: UIViewController {

    // Тут нужно придумать текстовку правил (краткую) и отобразить их в UILabel
    
    @IBOutlet weak var rulesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func mainMenuButtonPress(_ sender: UIButton) {
        self.performSegue(withIdentifier: "fromRulesVCToMainMenuVC", sender: self)
    }
    
    
    
}

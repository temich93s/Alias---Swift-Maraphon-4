//
//  ResultsViewController.swift
//  Alias - Swift Maraphon 4
//
//  Created by Artem Solovev on 27.07.2022.
//

import UIKit

class ResultsViewController: UIViewController {

    // Здесь нужно отобразить в соотвествующий лейблах имена команд (тут они хранятся: GameModel.nameTeamNumber1 и GameModel.nameTeamNumber1) и их счет (тут они хранятся: GameModel.pointsTeamNumber1 и GameModel.pointsTeamNumber2)
    
    @IBOutlet weak var nameTeamNumber1Label: UILabel!
    @IBOutlet weak var nameTeamNumber2Label: UILabel!
    @IBOutlet weak var pointsTeamNumber1Label: UILabel!
    @IBOutlet weak var pointsTeamNumber2Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

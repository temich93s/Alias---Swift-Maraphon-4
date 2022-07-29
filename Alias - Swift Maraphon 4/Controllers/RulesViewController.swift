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
        rulesLabel.text = """
            Задача каждого игрока — объяснить как можно больше слов товарищам по команде за ограниченное время.
            
            Во время объяснения нельзя использовать однокоренные слова и озвучивать перевод с иностранных языков.
            
            Отгаданное слово должно точно совпадать. Оно приносит команде 1 очко, а за пропущенное слово команда штрафуется.
            
            Если объясняющий игрок называет часть слова, указанного в карточке, то слово не будет принято и команда потеряет 1 очко.
            
            Победителем считается команда, набравшая необходимое для победы количество очков.
            
            Удачи!
            """
    }
    
    @IBAction func mainMenuPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

    @IBAction func mainMenuButtonPress(_ sender: UIButton) {
        self.performSegue(withIdentifier: "fromRulesVCToMainMenuVC", sender: self)
    }
    
    
    
}

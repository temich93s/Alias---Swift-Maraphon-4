//
//  MainMenuViewController.swift
//  Alias - Swift Maraphon 4
//
//  Created by Artem Solovev on 27.07.2022.
//

import UIKit

class MainMenuViewController: UIViewController {

    // Здесь нужно добавить сохранение внесенных пользователем имен команд в свойства GameModel.nameTeamNumber1, GameModel.nameTeamNumber2
    
    // Так же надо добавить сохранение темы в GameModel.currentTheme зависимости от нажатой кнопки с темой (выбранная тема кнопки должа выделяться цветом)
    
    @IBOutlet weak var nameTeamNumber1TextField: UITextField!
    @IBOutlet weak var nameTeamNumber2TextField: UITextField!
    
    @IBOutlet weak var theme1Button: UIButton!
    @IBOutlet weak var theme2Button: UIButton!
    @IBOutlet weak var theme3Button: UIButton!
    @IBOutlet weak var theme4Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ddd = JokeModel()
        ddd.fetchJoke()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func themeButtonPress(_ sender: UIButton) {
    }
    
    @IBAction func rulesButtonPress(_ sender: UIButton) {
        self.performSegue(withIdentifier: "fromMainMenuVCToRulesVC", sender: self)
    }
    
    @IBAction func gameButtonPress(_ sender: UIButton) {
        self.performSegue(withIdentifier: "fromMainMenuVCToGameVC", sender: self)
    }
    
}

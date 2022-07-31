//
//  MainMenuViewController.swift
//  Alias - Swift Maraphon 4
//
//  Created by Artem Solovev on 27.07.2022.
//

import UIKit

class MainMenuViewController: UIViewController, UITextFieldDelegate {

    // Здесь нужно добавить сохранение внесенных пользователем имен команд в свойства GameModel.nameTeamNumber1, GameModel.nameTeamNumber2
    
    // Так же надо добавить сохранение темы в GameModel.currentTheme зависимости от нажатой кнопки с темой (выбранная тема кнопки должа выделяться цветом)
    
    @IBOutlet weak var nameTeamNumber1TextField: UITextField!
    @IBOutlet weak var nameTeamNumber2TextField: UITextField!
    
    @IBOutlet weak var theme1Button: UIButton!
    @IBOutlet weak var theme2Button: UIButton!
    @IBOutlet weak var theme3Button: UIButton!
    @IBOutlet weak var theme4Button: UIButton!
    @IBOutlet weak var topicSelection: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        let ddd = JokeModel()
        ddd.fetchJoke()
        
        nameTeamNumber1TextField.delegate = self
        nameTeamNumber2TextField.delegate = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

            view.addGestureRecognizer(tap)

    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        nameTeamNumber1TextField.endEditing(true)
        nameTeamNumber2TextField.endEditing(true)

        return true
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        
        if let name = nameTeamNumber1TextField.text {
            GameModel.nameTeamNumber1 = name
        } else {
            textField.text = ""
        }
        if let name = nameTeamNumber2TextField.text {
            GameModel.nameTeamNumber2 = name
        } else {
            textField.text = ""
        }
        
    }
    
    
    
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    
    @IBAction func themeButtonPress(_ sender: UIButton) {
        
        switch sender.currentTitle {
        case theme1Button.currentTitle: GameModel.currentTheme = GameModel.wordSets[0]
        case theme2Button.currentTitle: GameModel.currentTheme = GameModel.wordSets[1]
        case theme3Button.currentTitle: GameModel.currentTheme = GameModel.wordSets[2]
        case theme4Button.currentTitle: GameModel.currentTheme = GameModel.wordSets[3]
        default: break
        }
        
        topicSelection.text = "Выбрана тема: \n\(sender.currentTitle ?? "")"
        
        theme1Button.backgroundColor = UIColor(named: "FFFBE0")
        theme2Button.backgroundColor = UIColor(named: "FFFBE0")
        theme3Button.backgroundColor = UIColor(named: "FFFBE0")
        theme4Button.backgroundColor = UIColor(named: "FFFBE0")
        
        sender.backgroundColor = UIColor(named: "FCE38A")
        
    }
    
    @IBAction func rulesButtonPress(_ sender: UIButton) {
        self.performSegue(withIdentifier: "fromMainMenuVCToRulesVC", sender: self)
    }
    
    @IBAction func gameButtonPress(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "fromMainMenuVCToGameVC", sender: self)
    }
    
}






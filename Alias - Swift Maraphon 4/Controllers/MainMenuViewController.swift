//
//  MainMenuViewController.swift
//  Alias - Swift Maraphon 4
//
//  Created by Artem Solovev on 27.07.2022.
//

import UIKit

class MainMenuViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nameTeamNumber1TextField: UITextField!
    @IBOutlet weak var nameTeamNumber2TextField: UITextField!
    @IBOutlet weak var theme1Button: UIButton!
    @IBOutlet weak var theme2Button: UIButton!
    @IBOutlet weak var theme3Button: UIButton!
    @IBOutlet weak var theme4Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTeamNumber1TextField.delegate = self
        nameTeamNumber2TextField.delegate = self
        nameTeamNumber1TextField.text = GameModel.nameTeamNumber1
        nameTeamNumber2TextField.text = GameModel.nameTeamNumber2
        theme1Button.backgroundColor = UIColor(named: "FCE38A")
        
        // создаем жест
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))

        // добавляем у View распознавание жеста tap
        view.addGestureRecognizer(tap)
        
    }
    
    // код который выполняется при распозновании жеста
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
//    // UIKit вызывает этот метод при обнаружении нового касания во представлении View. Многие классы UIKit переопределяют этот метод и используют его для обработки соответствующих событий касания.
//    // Альтернативный способ убрать клавиатуру при нажатии на View
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.view.endEditing(true)
//    }
    
    // Спрашивает делегата, следует ли обрабатывать нажатие кнопки Return для текстового поля.
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Приводит к тому, что представление (или одно из его встроенных текстовых полей) отойдет из статуса первого ответчика.
        self.view.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if let nameTeamNumber1 = nameTeamNumber1TextField.text {
            if nameTeamNumber1 == "" {
                GameModel.nameTeamNumber1 = "Команда 1"
            } else {
                GameModel.nameTeamNumber1 = nameTeamNumber1
            }
        }
        
        if let nameTeamNumber2 = nameTeamNumber2TextField.text {
            if nameTeamNumber2 == "" {
                GameModel.nameTeamNumber2 = "Команда 2"
            } else {
                GameModel.nameTeamNumber2 = nameTeamNumber2
            }
        }
        
        nameTeamNumber1TextField.text = GameModel.nameTeamNumber1
        nameTeamNumber2TextField.text = GameModel.nameTeamNumber2
    }
    
    @IBAction func themeButtonPress(_ sender: UIButton) {
        self.view.endEditing(true)
        
        switch sender.currentTitle {
        case theme1Button.currentTitle: GameModel.currentTheme = GameModel.wordSets[0]
        case theme2Button.currentTitle: GameModel.currentTheme = GameModel.wordSets[1]
        case theme3Button.currentTitle: GameModel.currentTheme = GameModel.wordSets[2]
        case theme4Button.currentTitle: GameModel.currentTheme = GameModel.wordSets[3]
        default: break
        }

        theme1Button.backgroundColor = UIColor(named: "FFFBE0")
        theme2Button.backgroundColor = UIColor(named: "FFFBE0")
        theme3Button.backgroundColor = UIColor(named: "FFFBE0")
        theme4Button.backgroundColor = UIColor(named: "FFFBE0")
        
        sender.backgroundColor = UIColor(named: "FCE38A")
    }
    
    @IBAction func rulesButtonPress(_ sender: UIButton) {
        self.view.endEditing(true)
        self.performSegue(withIdentifier: "fromMainMenuVCToRulesVC", sender: self)
    }
    
    @IBAction func gameButtonPress(_ sender: UIButton) {
        self.view.endEditing(true)
        self.performSegue(withIdentifier: "fromMainMenuVCToGameVC", sender: self)
    }
}






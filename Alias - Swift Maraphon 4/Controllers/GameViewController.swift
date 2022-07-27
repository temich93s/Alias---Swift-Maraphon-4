//
//  GameViewController.swift
//  Alias - Swift Maraphon 4
//
//  Created by Artem Solovev on 27.07.2022.
//

import UIKit

class GameViewController: UIViewController {

    // numberRoundLabel - нужно отобразить номер раунда
    // nameTeamLabel - нужно отобразить имя команды чей ход (имя хранится в: GameModel.nameTeamNumber1 или GameModel.nameTeamNumber1)
    // timeLeftLabel - нужно сделать и отобразить таймер обратного отсчета
    // wordsAndJokesLabel - нужно отобразить слово которое сейчас нужно отгадать (в конце раунда в этом лейбле будет отображаться шутка, шутка шранится в свойстве: GameModel.jokeText )
    // specialStatusWordLabel - нужно отобразить по правилам игры является ли слово "слово-действием", или "последним словом" которое могут отгадывать все команды
    // controlButton - кнопка должна менять свой текст и выполнение действий в соотвествующем режиме (режимы: "Старт" (игра начинается и запускается таймер), "Сбросить" (сбрасывает таймер и слова, начинается текущий раунд заново), "Следующий раунд" (все сбрасывается и начинается ход следующей команды), "Итоги игры" (переносит на окно с итогами игры))
    // correctAnswerButtonPress - слово угадано, добавляются очки в GameModel.pointsTeamNumber1 или GameModel.pointsTeamNumber2
    // skipButtonPress - пропуск слова, отнимая при этом очки в GameModel.pointsTeamNumber1 или GameModel.pointsTeamNumber2
    
    @IBOutlet weak var numberRoundLabel: UILabel!
    @IBOutlet weak var nameTeamLabel: UILabel!
    @IBOutlet weak var timeLeftLabel: UILabel!
    @IBOutlet weak var wordsAndJokesLabel: UILabel!
    @IBOutlet weak var specialStatusWordLabel: UILabel!
    @IBOutlet weak var controlButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func controlButtonPress(_ sender: UIButton) {
    }
    
    @IBAction func skipButtonPress(_ sender: UIButton) {
    }
    
    @IBAction func correctAnswerButtonPress(_ sender: UIButton) {
    }
    
}

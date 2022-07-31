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
    
    var jokeModel = JokeModel()
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Стартовое отображение элементов
        wordsAndJokesLabel.text = ""
        specialStatusWordLabel.text = ""
        controlButton.setTitle("Старт", for: .normal)
        numberRoundLabel.text = "Раунд #\(GameModel.currentRound)"
        nameTeamLabel.text = "Играют \(GameModel.currentTeam)"
        timeLeftLabel.text = "Осталось: \(GameModel.lengthRound) сек."
        
    }
    
    @IBAction func controlButtonPress(_ sender: UIButton) {
        //Переключатель кнопки
        
        if sender.currentTitle == "Старт" {
            sender.setTitle("Сбросить время", for: .normal)
            //Таймер
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
            GameModel.wordNumberChange()
            updateUI()
        } else if sender.currentTitle == "Сбросить время" {
            sender.setTitle("Старт", for: .normal)
            timer.invalidate()
            GameModel.seconds = GameModel.lengthRound
            timeLeftLabel.text = "Осталось: \(GameModel.lengthRound) сек."
            
        } else if sender.currentTitle == "Следущий раунд" || sender.currentTitle == "Следущая команда" {
            sender.setTitle("Старт", for: .normal)
            GameModel.currentGame += 1
            GameModel.changeCurrentRound()
            GameModel.whatCurrentTeam(round: GameModel.currentGame)
            GameModel.seconds = GameModel.lengthRound
            updateUI()
            wordsAndJokesLabel.text = ""

            
        }
        
    }
    
    @IBAction func skipButtonPress(_ sender: UIButton) {
        if GameModel.seconds == GameModel.lengthRound {
            return
        } else {
            GameModel.pointMinus()
            GameModel.wordNumberChange()
            updateUI()
        }
        
    }
    
    @IBAction func correctAnswerButtonPress(_ sender: UIButton) {
        if GameModel.seconds == GameModel.lengthRound {
            return
        } else {
            GameModel.pointPlus()
            GameModel.wordNumberChange()
            updateUI()
        }
    }
    
    @objc func fireTimer() {
        if GameModel.seconds > 0 {
            GameModel.seconds -= 1
            updateUI()
            
        } else {
            timer.invalidate()
            if GameModel.currentGame % 2 != 0 {
                controlButton.setTitle("Следущая команда", for: .normal)
            } else {
                controlButton.setTitle("Следущий раунд", for: .normal)
            }
            if GameModel.currentGame == 6 {
                controlButton.setTitle("Результаты", for: .normal)
                timeLeftLabel.text = ""
            }
            GameModel.seconds = GameModel.lengthRound
            updateUI()
            wordsAndJokesLabel.text = GameModel.jokeText

        }
        
    }
    
    func updateUI() {
        numberRoundLabel.text = "Раунд #\(GameModel.currentRound)"
        nameTeamLabel.text = "Играют \(GameModel.currentTeam)"
        timeLeftLabel.text = "Осталось: \(GameModel.seconds) сек."
        wordsAndJokesLabel.text = GameModel.currentTheme[GameModel.wordNumber]
    }
    
    
}


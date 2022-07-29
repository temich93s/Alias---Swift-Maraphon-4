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
    
    
    var timer = Timer()
    var wordNumber = 0
    
    @IBOutlet weak var numberRoundLabel: UILabel!
    @IBOutlet weak var nameTeamLabel: UILabel!
    @IBOutlet weak var timeLeftLabel: UILabel!
    @IBOutlet weak var wordsAndJokesLabel: UILabel!
    @IBOutlet weak var specialStatusWordLabel: UILabel!
    @IBOutlet weak var controlButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        specialStatusWordLabel.text = ""
        timeLeftLabel.text = "Осталось: \(GameModel.roundTime) сек."
        
    }
    
    @IBAction func controlButtonPress(_ sender: UIButton) {
        
        updateText()
        
        //Обнуление и запуск таймера, изменение тайтла кнопки
        if controlButton.currentTitle == "СТАРТ" {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
            controlButton.setTitle("СБРОС", for: .normal)
        } else if controlButton.currentTitle == "СБРОС" {
            timer.invalidate()
            controlButton.setTitle("СТАРТ", for: .normal)
            GameModel.roundTime = 60
            timeLeftLabel.text = "Осталось: \(GameModel.roundTime) сек."
            wordNumber = 0
            updateText()
        }
        
    }
    
    @IBAction func skipButtonPress(_ sender: UIButton) {
        wordNumber += 1
        updateText()

    }
    
    @IBAction func correctAnswerButtonPress(_ sender: UIButton) {
        
        wordNumber += 1
        updateText()
        
        if nameTeamLabel.text == "Ходит: \(GameModel.nameTeamNumber1)" {
            GameModel.pointsTeamNumber1 += 1
            print(GameModel.pointsTeamNumber1)
        } else {
            GameModel.pointsTeamNumber2 += 1
        }
    }
    
    @objc func updateCounter() {
        //Реализация таймера
        if GameModel.roundTime > 0 {
            GameModel.roundTime -= 1
            timeLeftLabel.text = "Осталось: \(GameModel.roundTime) сек."
        } else {
            timer.invalidate()
        }
    }
    
    
    func updateText() {
        wordsAndJokesLabel.text = GameModel.wordSets[0][wordNumber]
    }
    
    
}


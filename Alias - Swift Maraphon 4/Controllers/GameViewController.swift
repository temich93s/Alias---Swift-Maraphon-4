//
//  GameViewController.swift
//  Alias - Swift Maraphon 4
//
//  Created by Artem Solovev on 27.07.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var numberRoundLabel: UILabel!
    @IBOutlet weak var nameTeamLabel: UILabel!
    @IBOutlet weak var timeLeftLabel: UILabel!
    @IBOutlet weak var wordsAndJokesLabel: UILabel!
    @IBOutlet weak var specialStatusWordLabel: UILabel!
    @IBOutlet weak var controlButton: UIButton!
    @IBOutlet weak var correctAnswerButton: UIButton!
    @IBOutlet weak var skipAnswerButton: UIButton!
    @IBOutlet weak var wordsAndJokesAndSpecialStatusWordStackView: UIStackView!
    
    var timer = Timer()
    
    //---
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Стартовое отображение элементов
        specialStatusWordLabel.text = ""
        controlButton.setTitle("Начать игру", for: .normal)
        numberRoundLabel.text = "Раунд #\(GameModel.currentRound)"
        nameTeamLabel.text = "Играет \(GameModel.currentTeam)"
        timeLeftLabel.text = "Осталось: \(GameModel.lengthWholeRound) сек."
        wordsAndJokesLabel.text = "Играет команда: \(GameModel.currentTeam)"
        wordsAndJokesAndSpecialStatusWordStackView.backgroundColor = UIColor(named: "FCE38A")
        correctAnswerButton.isEnabled = false
        skipAnswerButton.isEnabled = false
    }
    
    @IBAction func controlButtonPress(_ sender: UIButton) {
        //Переключатель кнопки
        
        if sender.currentTitle == "Начать игру" {
            sender.setTitle("Сбросить раунд", for: .normal)
            JokeModel.fetchJoke()
            wordsAndJokesAndSpecialStatusWordStackView.backgroundColor = UIColor(named: "FFFBE0")
            //Таймер
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
            //+++
            GameModel.wordNumberChange()
            correctAnswerButton.isEnabled = true
            skipAnswerButton.isEnabled = true
            //+++
            updateUI()
        
        //---
        } else if sender.currentTitle == "Сбросить раунд" {
            sender.setTitle("Начать игру", for: .normal)
            timer.invalidate()
            GameModel.lengthCurrentRound = GameModel.lengthWholeRound
            wordsAndJokesLabel.text = ""
            timeLeftLabel.text = "Осталось: \(GameModel.lengthCurrentRound) сек."
            correctAnswerButton.isEnabled = false
            skipAnswerButton.isEnabled = false
        
        //---
        } else if sender.currentTitle == "Следущий раунд" || sender.currentTitle == "Ход следующей команды" {
            sender.setTitle("Начать игру", for: .normal)
            GameModel.currentGame += 1
            GameModel.changeCurrentRound()
            GameModel.whatCurrentTeam(round: GameModel.currentGame)
            GameModel.lengthCurrentRound = GameModel.lengthWholeRound
            wordsAndJokesAndSpecialStatusWordStackView.backgroundColor = UIColor(named: "FCE38A")
            correctAnswerButton.isEnabled = false
            skipAnswerButton.isEnabled = false
            updateUI()
            wordsAndJokesLabel.text = "Играет команда: \(GameModel.currentTeam)"
        
        //---
        } else if sender.currentTitle == "Результаты" {
            self.performSegue(withIdentifier: "fromGameVCToResultsVC", sender: self)
        }
    }
    
    //---
    @IBAction func skipButtonPress(_ sender: UIButton) {
        GameModel.pointMinus()
        //+++
        GameModel.wordNumberChange()
        AVPlayerModel.playSound(sound: "skip")
        updateUI()
    }
    
    //---
    @IBAction func correctAnswerButtonPress(_ sender: UIButton) {
        GameModel.pointPlus()
        //+++
        GameModel.wordNumberChange()
        AVPlayerModel.playSound(sound: "correct")
        updateUI()
    }
    
    //---
    @objc func countdown() {
        if GameModel.lengthCurrentRound > 0 {
            GameModel.lengthCurrentRound -= 1
            updateUI()
        } else {
            // .invalidate() - остановка таймера
            timer.invalidate()
            
            // определяем чей следующий раунд/ход
            if GameModel.currentGame % 2 != 0 {
                controlButton.setTitle("Ход следующей команды", for: .normal)
            } else {
                controlButton.setTitle("Следущий раунд", for: .normal)
            }
            
            // если все ходы закончились, то меняем режим кнопки controlButton на "Результаты"
            if GameModel.currentGame == 6 {
                controlButton.setTitle("Результаты", for: .normal)
                timeLeftLabel.text = ""
            }
            wordsAndJokesLabel.text = GameModel.jokeText
            wordsAndJokesAndSpecialStatusWordStackView.backgroundColor = UIColor(named: "FCE38A")
            correctAnswerButton.isEnabled = false
            skipAnswerButton.isEnabled = false
        }
    }
    
    //---
    func updateUI() {
        numberRoundLabel.text = "Раунд #\(GameModel.currentRound)"
        nameTeamLabel.text = "Играет \(GameModel.currentTeam)"
        timeLeftLabel.text = "Осталось: \(GameModel.lengthCurrentRound) сек."
        //+++
        wordsAndJokesLabel.text = GameModel.currentTheme[GameModel.wordNumber]
    }
    
}


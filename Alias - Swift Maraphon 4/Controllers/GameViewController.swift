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
    var setOfWordsInCorrentGame = GameModel.currentTheme
    var setOfWordsInCorrentMove: [String] = []
    var numberWordStatusAdjective = 0
    var numberWordStatus10Words = 0
    var pointsCurrentMove = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        if sender.currentTitle == "Начать игру" {
            sender.setTitle("Сбросить раунд", for: .normal)
            JokeModel.fetchJoke()
            wordsAndJokesAndSpecialStatusWordStackView.backgroundColor = UIColor(named: "FFFBE0")
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
            correctAnswerButton.isEnabled = true
            skipAnswerButton.isEnabled = true
            for _ in 1...7 {
                setOfWordsInCorrentMove.append(setOfWordsInCorrentGame.remove(at: Int.random(in: 0..<setOfWordsInCorrentGame.count)))
            }
            specialWord()
            updateUI()

        } else if sender.currentTitle == "Сбросить раунд" {
            sender.setTitle("Начать игру", for: .normal)
            timer.invalidate()
            GameModel.lengthCurrentRound = GameModel.lengthWholeRound
            wordsAndJokesLabel.text = ""
            timeLeftLabel.text = "Осталось: \(GameModel.lengthCurrentRound) сек."
            correctAnswerButton.isEnabled = false
            skipAnswerButton.isEnabled = false
            setOfWordsInCorrentGame += setOfWordsInCorrentMove
            setOfWordsInCorrentMove = []
            switch GameModel.currentTeam {
            case GameModel.nameTeamNumber1: GameModel.pointsTeamNumber1 -= pointsCurrentMove
            case GameModel.nameTeamNumber2: GameModel.pointsTeamNumber2 -= pointsCurrentMove
            default: break
            }
            pointsCurrentMove = 0
            GameModel.wordNumber = 0
            specialWord()
            updateUI()
        
        } else if sender.currentTitle == "Следущий раунд" || sender.currentTitle == "Ход следующей команды" {
            sender.setTitle("Начать игру", for: .normal)
            GameModel.currentGame += 1
            GameModel.changeCurrentRound()
            GameModel.whatCurrentTeam(round: GameModel.currentGame)
            GameModel.lengthCurrentRound = GameModel.lengthWholeRound
            wordsAndJokesAndSpecialStatusWordStackView.backgroundColor = UIColor(named: "FCE38A")
            correctAnswerButton.isEnabled = false
            skipAnswerButton.isEnabled = false
            GameModel.wordNumber = 0
            setOfWordsInCorrentMove = []
            pointsCurrentMove = 0
            updateUI()
            wordsAndJokesLabel.text = "Играет команда: \(GameModel.currentTeam)"
        
        } else if sender.currentTitle == "Результаты" {
            self.performSegue(withIdentifier: "fromGameVCToResultsVC", sender: self)
        }
    }
    
    @IBAction func skipButtonPress(_ sender: UIButton) {
        AVPlayerModel.playSound(sound: "skip")
        if GameModel.wordNumber == numberWordStatusAdjective
            || GameModel.wordNumber == numberWordStatus10Words {
            GameModel.pointMinus()
            GameModel.pointMinus()
            GameModel.pointMinus()
            pointsCurrentMove -= 3
        } else {
            GameModel.pointMinus()
            pointsCurrentMove -= 1
        }
        GameModel.wordNumberChange()
        updateUI()
    }
    
    @IBAction func correctAnswerButtonPress(_ sender: UIButton) {
        AVPlayerModel.playSound(sound: "correct")
        if GameModel.wordNumber == numberWordStatusAdjective
            || GameModel.wordNumber == numberWordStatus10Words {
            GameModel.pointPlus()
            GameModel.pointPlus()
            GameModel.pointPlus()
            pointsCurrentMove += 3
        } else if GameModel.wordNumber == 6 {
            commonWord()
        } else {
            GameModel.pointPlus()
            pointsCurrentMove += 1
        }
        print("pointsTeamNumber1: \(GameModel.pointsTeamNumber1)")
        print("pointsTeamNumber2: \(GameModel.pointsTeamNumber2)")
        GameModel.wordNumberChange()
        updateUI()
    }
    
    @objc func countdown() {
        if GameModel.lengthCurrentRound > 0 {
            GameModel.lengthCurrentRound -= 1
            updateUI()
        } else {
            gameStop()
        }
    }
    
    func updateUI() {
        numberRoundLabel.text = "Раунд #\(GameModel.currentRound)"
        nameTeamLabel.text = "Играет \(GameModel.currentTeam)"
        timeLeftLabel.text = "Осталось: \(GameModel.lengthCurrentRound) сек."
        
        if controlButton.currentTitle == "Сбросить раунд" {
            if GameModel.wordNumber == numberWordStatusAdjective {
                specialStatusWordLabel.text = "ПРИЛАГАТЕЛЬНЫЕ"
            } else if GameModel.wordNumber == numberWordStatus10Words {
                specialStatusWordLabel.text = "10 СЛОВ"
            } else if GameModel.wordNumber == 6 {
                specialStatusWordLabel.text = "ОТГАДЫВАЮТ ВСЕ"
            } else {
                specialStatusWordLabel.text = ""
            }
        } else {
            specialStatusWordLabel.text = ""
        }

        if GameModel.wordNumber > 6 {
            gameStop()
        } else if controlButton.currentTitle == "Начать игру" {
            wordsAndJokesLabel.text = "Играет команда: \(GameModel.currentTeam)"
        } else {
            wordsAndJokesLabel.text = setOfWordsInCorrentMove[GameModel.wordNumber]
        }
    }
    
    func gameStop() {
        // .invalidate() - остановка таймера
        timer.invalidate()
        
        // определяем чей следующий раунд/ход
        if GameModel.currentGame % 2 != 0 {
            controlButton.setTitle("Ход следующей команды", for: .normal)
        } else {
            controlButton.setTitle("Следущий раунд", for: .normal)
        }
        
        // если все ходы закончились, то меняем режим кнопки controlButton на "Результаты"
        if GameModel.currentGame == 8 {
            controlButton.setTitle("Результаты", for: .normal)
            timeLeftLabel.text = ""
        }
        
        setOfWordsInCorrentMove = []
        pointsCurrentMove = 0
        wordsAndJokesLabel.text = GameModel.jokeText
        wordsAndJokesAndSpecialStatusWordStackView.backgroundColor = UIColor(named: "FCE38A")
        correctAnswerButton.isEnabled = false
        skipAnswerButton.isEnabled = false
    }
    
    func specialWord() {
        numberWordStatusAdjective = Int.random(in: 0...5)
        repeat {
            numberWordStatus10Words = Int.random(in: 0...5)
        } while numberWordStatus10Words == numberWordStatusAdjective
    }
    
    func commonWord() {
        let alert = UIAlertController(title: "Какая команда отгадала слово: \(setOfWordsInCorrentMove[GameModel.wordNumber]) ?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "\(GameModel.nameTeamNumber1)", style: .default, handler: { UIAlertAction in
            GameModel.pointsTeamNumber1 += 3
        }))
        alert.addAction(UIAlertAction(title: "\(GameModel.nameTeamNumber2)", style: .default, handler: { UIAlertAction in
            GameModel.pointsTeamNumber2 += 3
        }))
        self.present(alert, animated: true, completion: nil)
    }
}


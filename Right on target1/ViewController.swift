//
//  ViewController.swift
//  Right on target1
//
//  Created by Sergey Medvedev on 03.11.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var game: Game!
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    
    // MARK: - Жизненный цикл
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let generator = NumberGenerator(startValue: 1, endValue: 50)!
        game = Game(valueGanerator: generator, rounds: 5)
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
    }
    
    // MARK: - Взаимодействие с View - Model
    
    @IBAction func checkNumber() {
        game.currentRound.calculateScore(with: Int(slider.value))
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateLabelWithSecretNumber(newText: String(game.currentRound.currentSecretValue))
    }
    
    // MARK: - Обновление View
    
    private func updateLabelWithSecretNumber(newText: String) {
        label.text = newText
    }
   
    private func showAlertWith(score: Int) {
        let alert = UIAlertController(title: "Игра Окончена", message: "Вы набарали \(score) очков", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
}



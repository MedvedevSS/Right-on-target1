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
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    
    // MARK: - Взаимодействие с View - Model
    
    @IBAction func checkNumber() {
        game.calculateScore(with: Int(slider.value))
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewRound()
        }
        updateLabelWithSecretNumber(newText: String(game.currentSecretValue))
    }
    
    // MARK: - Обновление View
    
    private func updateLabelWithSecretNumber(newText: String) {
        label.text = newText
    }
    
    private func showAlertWith(score: Int) {
        let alert = UIAlertController(title: "Игра окончена", message: "Вы набрали \(score) очков", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}



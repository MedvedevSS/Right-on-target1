//
//  ViewController.swift
//  Right on target1
//
//  Created by Sergey Medvedev on 03.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var label: UILabel!
    
    var number = 0
    var round = 1
    var points = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidload")
        
        number = Int.random(in: 1...50)
        label.text = String(number)
    }
    @IBAction func checkNumber() {
    
            let numSlider = Int(slider.value)
            if numSlider > number {
                points += 50 - numSlider + number
            } else if numSlider < number {
                points += 50 - number + numSlider
            } else {
                points += 50
            }
            if round == 5 {
                let alert = UIAlertController(title: "Игра окончена", message: "Вы набрали \(points) очков", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                round = 1
                points = 0
            } else {
                round += 1
            }
            number = Int.random(in: 1...50)
            label.text = String(number)
        }
    }



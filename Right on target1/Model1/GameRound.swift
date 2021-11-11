//
//  GameRound.swift
//  Right on target1
//
//  Created by Sergey Medvedev on 07.11.2021.
//

import UIKit

protocol GameRoundProtocol  {
    var score: Int { get }
    var currentSecretValue: Int { get }
    
    func calculateScore(with value: Int)
}

class GameRound: GameRoundProtocol {
    var score = 0
    var currentSecretValue: Int = 0
    
    init(secretValue: Int) {
        currentSecretValue = secretValue
    }
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score += 50 - currentSecretValue + value
        } else {
            score += 50
        }
    }
}

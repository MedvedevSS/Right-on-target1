//
//  Model.swift
//  Right on target1
//
//  Created by Sergey Medvedev on 06.11.2021.
//

import UIKit

protocol GameProtocol {
    var score: Int { get }
//    var currentSecretValue: Int { get }
    var secretValueGenerator: GeneratorProtocol { get }
    var currentRound: GameRoundProtocol! { get }
    var isGameEnded: Bool { get }
    
    func restartGame()
    func startNewRound()
//    func calculateScore(with value: Int)
}

class Game: GameProtocol {
    
    var score: Int {
        var totalScore: Int = 0
        for round in self.rounds {
            totalScore += round.score
        }
        return totalScore
    }
   
    var currentRound: GameRoundProtocol!
    private var rounds: [GameRoundProtocol] = []
    var secretValueGenerator: GeneratorProtocol
    private var roundCount: Int!
    var isGameEnded: Bool {
       if roundCount == rounds.count {
            return true
        } else {
            return false
        }
    }
    
    init(valueGanerator: GeneratorProtocol, rounds: Int) {
        secretValueGenerator = valueGanerator
        roundCount = rounds
        startNewRound()
      
    }
    
    func restartGame() {
        rounds = []
        startNewRound()
    }
    
    func startNewRound() {
        let newSecretValue = self.getNewSecretValue()
        currentRound = GameRound(secretValue: newSecretValue)
        rounds.append(currentRound)
    }
    
    private func getNewSecretValue() -> Int {
        return secretValueGenerator.getRandomValue()
    }
    
//    func restartGame() {
//        score = 0
//        currentRound = 0
//        startNewRound()
//    }
//
//    func startNewRound() {
//        currentSecretValue = getNewSecretValue()
//        currentRound += 1
//    }
    
//    private func getNewSecretValue() -> Int {
//        (minSecretValue...maxSecretValue).randomElement()!
//    }
    
//    func calculateScore(with value: Int) {
//        if value > currentSecretValue {
//            score += 50 - value + currentSecretValue
//        } else if value < currentSecretValue {
//            score += 50 - currentSecretValue + value
//        } else {
//            score += 50
//        }
//    }
    

}

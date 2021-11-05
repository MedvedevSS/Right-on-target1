//
//  Game.swift
//  Right on target1
//
//  Created by Sergey Medvedev on 04.11.2021.
//

import UIKit

protocol GameProtocol {
    // Количество заработанных очков
    var score: Int { get }
    // Загаданное значение
    var currentSecretValue: Int { get }
    // Проверяет, законечна ли игра
    var isGameEnded: Bool { get }
    // Начинает новую игру
    func restartGame()
    // Начинает новый раунд (обновляет загаданное число)
    func startNewRound()
    // Сравнивает переданнное число с загаданным и начисляет очки
    func calculateScore(with value: Int)
}

class Game: GameProtocol {

    var score: Int = 0
    // Минимальное загаданное значение
    private var minSecrenValue: Int
    // Максимальное загаданное значение
    private var maxSecrenValue: Int
    var currentSecretValue: Int = 0
    // Количество раундов
    private var lastRound: Int
    private var currentRound: Int = 1

    var isGameEnded: Bool {
        if currentRound >= lastRound {
            return true
        } else {
            return false
        }
    }

    init?(startValue: Int, endValue: Int, rounds: Int) {
        // Стартовое значение для выбора случайного числа не может быть больше конечного
        guard startValue <= endValue else {
            return nil
        }
        minSecrenValue = startValue
        maxSecrenValue = endValue
        lastRound = rounds
        currentSecretValue = getNewSecretValue()
    }


    func restartGame() {
        currentRound = 0
        score = 0
        startNewRound()
    }

    func startNewRound() {
        currentSecretValue = getNewSecretValue()
        currentRound += 1
    }
    // Загадать и вернуть новое случайное значение
    private func getNewSecretValue() -> Int {
        (minSecrenValue...maxSecrenValue).randomElement()!
    }
    // подсчитывает количество очков
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

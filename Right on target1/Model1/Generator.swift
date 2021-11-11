//
//  GeneratorNumber.swift
//  Right on target1
//
//  Created by Sergey Medvedev on 07.11.2021.
//

import UIKit

protocol GeneratorProtocol {
    func getRandomValue() -> Int
}

class NumberGenerator: GeneratorProtocol {
        private var startRangeValue: Int
        private var endRangeValue: Int
        
        init?(startValue: Int, endValue: Int) {
            guard startValue <= endValue else {
                return nil
            }
            startRangeValue = startValue
            endRangeValue = endValue
        }
        func getRandomValue() -> Int {
            (startRangeValue...endRangeValue).randomElement()!
        }
}

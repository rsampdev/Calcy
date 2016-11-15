//
//  Calcy.swift
//  Calcy
//
//  Created by Rodney Sampson on 11/13/16.
//  Copyright © 2016 com.rsampdev. All rights reserved.
//

import Foundation

internal final class Calcy {
    var firstOperand: Double = 0
    var secondOperand: Double = 0
    private(set) var operation: Operation
    
    init() {
        operation = .none
    }
    
    func enter(number: Double) {
        if firstOperand == 0 {
            firstOperand = number
        } else {
            secondOperand = number
        }
    }
    
    func changeOperation(operation: Operation) {
        self.operation = operation
    }
    
    func invert() {
        if secondOperand == 0 {
            firstOperand *= -1
        } else {
            secondOperand *= -1
        }
    }
    
    func percentage() {
        if secondOperand == 0 {
            firstOperand = firstOperand / 100
        } else {
            secondOperand = secondOperand / 100
        }
    }
    
    func calculate() -> Operation.OperationResult {
        let result = operation.operation(firstOperand: firstOperand, secondOperand: secondOperand)
        firstOperand = result.number
        return result
    }
    
    func handleClearing(with text: String) {
        if text == "AC" {
            clearAll()
        } else if text == "C" {
            clear()
        }
    }
    
    private func clear() {
        if operation == .none {
            firstOperand = 0
        } else {
            secondOperand = 0
        }
    }
    
    private func clearAll() {
        firstOperand = 0
        secondOperand = 0
        operation = .none
    }

}

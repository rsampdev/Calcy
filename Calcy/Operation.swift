//
//  Operation.swift
//  Calcy
//
//  Created by Rodney Sampson on 11/13/16.
//  Copyright © 2016 com.rsampdev. All rights reserved.
//

import Foundation

internal enum Operation {
    typealias OperationResult = (number: Double, string: String)
    
    case none
    case addition
    case subtraction
    case multiplication
    case division
    
    func symbol() -> String {
        switch self {
        case .none:
            return ""
        case .addition:
            return "+"
        case .subtraction:
            return "-"
        case .multiplication:
            return "×"
        case .division:
            return "÷"
        }
    }
    
    func operation(firstOperand: Double = 0.0, secondOperand: Double = 0.0) -> OperationResult {
        var result: OperationResult
        
        switch self {
        case .none:
            result = (number: firstOperand, string: String(firstOperand))
        case .addition:
            result = add(firstOperand: firstOperand, secondOperand: secondOperand)
        case .subtraction:
            result = subtract(firstOperand: firstOperand, secondOperand: secondOperand)
        case .multiplication:
            result = multiply(firstOperand: firstOperand, secondOperand: secondOperand)
        case .division:
            result = divide(firstOperand: firstOperand, secondOperand: secondOperand)
        }
        
        return result
    }
    
    private func add(firstOperand: Double, secondOperand: Double) -> OperationResult {
        let number = firstOperand + secondOperand
        let string = String(number)
        let result = (number: number, string: string)
        return result
    }
    
    private func subtract(firstOperand: Double, secondOperand: Double) -> OperationResult {
        let number = firstOperand - secondOperand
        let string = String(number)
        let result = (number: number, string: string)
        return result
    }
    
    private func multiply(firstOperand: Double, secondOperand: Double) -> OperationResult {
        let number = firstOperand * secondOperand
        let string = String(number)
        let result = (number: number, string: string)
        return result
    }
    
    private func divide(firstOperand: Double, secondOperand: Double) -> OperationResult {
        let result: OperationResult
        
        if secondOperand == 0 || secondOperand == 0.0 {
            result = (number: -0, string: "Error")
        } else {
            let number = firstOperand / secondOperand
            let string = String(number)
            result = (number: number, string: string)
        }
        
        return result
    }
    
}

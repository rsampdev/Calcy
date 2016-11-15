//
//  ViewController.swift
//  Calcy
//
//  Created by Rodney Sampson on 11/12/16.
//  Copyright © 2016 com.rsampdev. All rights reserved.
//

import UIKit

class CalcyViewController: UIViewController {
    
    @IBOutlet var firstOperandDisplay: UILabel!
    @IBOutlet var secondOperandDisplay: UILabel!
    @IBOutlet var operatorDisplay: UILabel!
    
    var calcy: Calcy = Calcy()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstOperandDisplay.text = "0.0"
        secondOperandDisplay.text = "0.0"
        firstOperandDisplay.adjustsFontSizeToFitWidth = true
        secondOperandDisplay.adjustsFontSizeToFitWidth = true
        operatorDisplay.text = calcy.operation.symbol()
    }
    
    private func updateDisplays() {
        firstOperandDisplay.text = "\(calcy.firstOperand)"
        secondOperandDisplay.text = "\(calcy.secondOperand)"
        operatorDisplay.text = calcy.operation.symbol()
    }
    
    @IBAction func numberButtonPressed(_ sender: UIButton) {
        guard let number = Double((sender.titleLabel?.text)!) else {
            return
        }
        
        calcy.enter(number: number)
        updateDisplays()
    }
    
    @IBAction func setSign(_ sender: UIButton) {
        guard let symbol = sender.titleLabel?.text else {
            return
        }
        
        var operation: Operation = .none
        
        switch symbol {
        case Operation.addition.symbol():
            operation = Operation.addition
        case Operation.subtraction.symbol():
            operation = Operation.subtraction
        case Operation.multiplication.symbol():
            operation = Operation.multiplication
        case Operation.division.symbol():
            operation = Operation.division
        default:
            return
        }
        
        calcy.changeOperation(operation: operation)
        updateDisplays()
    }
    
    @IBAction func invert(_ sender: UIButton) {
        calcy.invert()
        updateDisplays()
    }
    
    @IBAction func percentage(_ sender: UIButton) {
        calcy.percentage()
        updateDisplays()
    }
    
    @IBAction func calculateResult(_ sender: UIButton) {
        let result = calcy.calculate()
        
        if result.string == "Error" {
            calcy.handleClearing(with: "AC")
            updateDisplays()
            firstOperandDisplay.text = result.string
        } else {
            updateDisplays()
        }
    }
    
    @IBAction func clearAndAllClear(_ sender: UIButton) {
        guard let text = sender.titleLabel?.text else {
            return
        }
        
        calcy.handleClearing(with: text)
        updateDisplays()
    }
    
}

//
//  ViewController.swift
//  simple-calc
//
//  Created by ishansaksena on 4/19/16.
//  Copyright © 2016 ishansaksena. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Numbers entered thus far
    var n = [Double]()
    // Whether to clear the screen the next time a number is entered
    var clearScreen = true
    
    var operation: String = ""
    
    //var History: [String] = []

    @IBOutlet weak var ResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Gray background
        self.view.backgroundColor = UIColor.grayColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clear(sender: UIButton) {
        n = [Double]()
        clearScreen = true
        operation = ""
        ResultLabel.text = "0.0"
    }
    
    
    // A number was pressed
    @IBAction func operandPressed(sender: UIButton) {
        let number = sender.currentTitle!
        
        if clearScreen {// Replace whatever is in the label
            ResultLabel.text = number
            clearScreen = false
        } else {// Append to what is in the label
            ResultLabel.text?.appendContentsOf(number)
        }
    }
    
    // An operator was pressed
    @IBAction func operatorPressed(sender: UIButton) {
        // Add number in the label if any, to the array when operator is pressed
        n.append(Double(ResultLabel.text!)!)
        clearScreen = true
        NSLog("\(n)")
        
        // Execute operation
        let oper = sender.currentTitle!
        operation = oper
        
        // For debugging
        switch oper {
        case "÷": NSLog("Division")
        case "×": NSLog("Multiply")
        case "-": NSLog("Subtract")
        case "+": NSLog("Add")
        case "!": NSLog("Factorial")
        case "Count": NSLog("Count")
        case "AVG": NSLog("Average")
        case "sqrt": NSLog("sqrt")
        case "ln": NSLog("natural log")
        default: NSLog("No idea what's going on!!")
        }
    }
    
    // User presses Enter
    @IBAction func calculateResult(sender: UIButton) {
        NSLog("Enter pressed")
        clearScreen = true
        NSLog("\(n)")
        n.append(Double(ResultLabel.text!)!)
        
        var result = 0.0
        
        // Calculate result and print it to the label
        switch operation {
        case "÷": result = n[0] / n[1]
                History.expressions.append("\(n[0]) / \(n[1])")
        case "×": result = n[0] * n[1]
                History.expressions.append("\(n[0]) * \(n[1])")
        case "-": result = n[0] - n[1]
                History.expressions.append("\(n[0]) - \(n[1])")
        case "+": result = n[0] + n[1]
                History.expressions.append("\(n[0]) + \(n[1])")
        case "!": result = Double(fact(Int(n[0])))
                History.expressions.append("Factorial of \(n[0])")
        case "Count": result = Double(n.count)
                History.expressions.append("Count of \(n)")
        case "AVG": result = avg(n)
                History.expressions.append("Average of \(n)")
        case "ln": result = log(n[0])
                History.expressions.append("Natural Log of \(n[0])")
        default: NSLog("No idea what's going on!!")
                History.expressions.append("Invalid Command")
        }
        ResultLabel.text = "\(result)"
        NSLog("So far, the history is: \(History.expressions)")
    }
    
    // Returns the average of the numbers in the array
    func avg(n: [Double]) -> Double {
        var sum = 0.0
        for number in n {
            sum += number
        }
        return sum / Double(n.count)
    }
    
    // Returns the factorial of the number passed in
    func fact(number: Int) -> Int {
        var factorial = 1
        for index in 2...number {
            factorial *= index
        }
        return factorial
    }
}


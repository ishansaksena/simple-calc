//
//  ViewController.swift
//  simple-calc
//
//  Created by studentuser on 4/19/16.
//  Copyright © 2016 studentuser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Numbers entered thus far
    var numbers = [Int]()
    // Whether to clear the screen the next time a number is entered
    var clearScreen = true

    @IBOutlet weak var ResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.grayColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        numbers.append(Int(ResultLabel.text!)!)
        clearScreen = true
        NSLog("\(numbers)")
        
        // Execute operation
        let number = sender.currentTitle!
        switch number {
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
    }
}


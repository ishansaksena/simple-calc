//
//  HistoryViewController.swift
//  simple-calc
//
//  Created by ishansaksena on 4/26/16.
//  Copyright © 2016 studentuser. All rights reserved.
//

import Foundation
import UIKit

class HistoryViewController: UIViewController {
    
    @IBOutlet weak var HistoryUILabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Gray background
        self.view.backgroundColor = UIColor.grayColor()
        NSLog("\(History.expressions)")
        HistoryUILabel.text = "So far, we've calculated \(History.expressions)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


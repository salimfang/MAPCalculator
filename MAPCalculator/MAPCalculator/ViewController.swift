//
//  ViewController.swift
//  MAPCalculator
//
//  Created by Salim Fang on 2017/4/11.
//  Copyright © 2017年 Salim Fang. All rights reserved.
//

import Darwin
import UIKit

class ViewController: UIViewController {
    
    let formatter = NumberFormatter()
    

    
    var displayedNumberDouble:Double = 0
    var previousTypedNumber:Double = 0
    var calculationRequested = false
    var operationTapped:Int = 0
       
    @IBOutlet weak var resultDisplay: UILabel!
    
    @IBAction func numberTyped(_ sender: UIButton) {
        
        if calculationRequested == true {
            if sender.tag != 17 && sender.tag != 18 && sender.tag != 20 && sender.tag != 24
            {
            resultDisplay.text = String(sender.tag-1)
            
            } else if sender.tag == 17 // e
            {
                resultDisplay.text = String(M_E)
            } else if sender.tag == 18 // pi
            {
                resultDisplay.text = String(Double.pi)
            } else if sender.tag == 20 // plus-minus
            {
                displayedNumberDouble = Double(resultDisplay.text!)! * -1
                resultDisplay.text = String(displayedNumberDouble)
            } else if sender.tag == 24 // decimal mark
            {
                if resultDisplay.text!.contains("."){
                }else if resultDisplay.text == "0"{
                }else{
                    resultDisplay.text = resultDisplay.text! + "."
                }
            }
            calculationRequested = false
        }else{
        
            if resultDisplay.text == "0"
            {
                resultDisplay.text = ""
            }
            
            if sender.tag != 17 && sender.tag != 18 && sender.tag != 20 && sender.tag != 24
            {
            
            resultDisplay.text = resultDisplay.text! + String(sender.tag-1)
            } else if sender.tag == 17 // e
            {
                resultDisplay.text = String(M_E)
            } else if sender.tag == 18 // pi
            {
                resultDisplay.text = String(Double.pi)
            } else if sender.tag == 20 // plus-minus
            {
                displayedNumberDouble = Double(resultDisplay.text!)! * -1
                resultDisplay.text = String(displayedNumberDouble)
            } else if sender.tag == 24 // decimal mark
            {
                if resultDisplay.text!.contains("."){
                }else if resultDisplay.text == "0"{
                }else{
                    resultDisplay.text = resultDisplay.text! + "."
                }
            }
            
        }
        
    }
    
    
    @IBAction func operationRequested(_ sender: UIButton) {
        if resultDisplay.text !=  "" && sender.tag != 11 && sender.tag != 16 && sender.tag != 19 && sender.tag != 23{
            
            previousTypedNumber = Double(resultDisplay.text!)!
            
            if sender.tag == 12 // divide
            {
                resultDisplay.text = "÷"

            } else if sender.tag == 13 // multiply
            {
                resultDisplay.text = "×"

            } else if sender.tag == 14 // minus
            {
                resultDisplay.text = "-"
   
            } else if sender.tag == 15 // plus
            {
                resultDisplay.text = "+"
            } else if sender.tag == 21 // root
            {
                resultDisplay.text = "√"
            } else if sender.tag == 22 // power
            {
                resultDisplay.text = "^"
            }
            
            
            operationTapped = sender.tag
            calculationRequested = true
        } else if sender.tag == 16 // equal
        {
            displayedNumberDouble = Double(resultDisplay.text!)!
            
            if operationTapped == 12 // divide
            {
                resultDisplay.text = String(previousTypedNumber / displayedNumberDouble)
            } else if operationTapped == 13 // multiply
            {
                resultDisplay.text = String(previousTypedNumber * displayedNumberDouble)
            } else if operationTapped == 14 // minus
            {
                resultDisplay.text = String(previousTypedNumber - displayedNumberDouble)
            } else if operationTapped == 15 // plus
            {
                resultDisplay.text = String(previousTypedNumber + displayedNumberDouble)
            } else if operationTapped == 21 // root
            {
                var result = Double(previousTypedNumber)
                for _ in 0..<Int(displayedNumberDouble) {
                    result = sqrt(result)
                }
                resultDisplay.text = String(result)
                
            }else if operationTapped == 22 // power
            {

                var result = Double(1)
                for _ in 0..<Int(displayedNumberDouble) {
                    result *= Double(previousTypedNumber)
                }
                resultDisplay.text = String(result)
                
            }
            
            func checkNumber(labelText: String) -> String {
                var stringOfNumber: NSNumber
                stringOfNumber = formatter.number(from: labelText)!
                return String(describing: stringOfNumber)
            }
            
            resultDisplay.text = checkNumber(labelText: resultDisplay.text!)
            
        } else if sender.tag == 11 // erase
        {
            resultDisplay.text = "0"
            previousTypedNumber = 0
            displayedNumberDouble = 0
            operationTapped = 0
        } else if sender.tag == 19 // log10
        {
            displayedNumberDouble = Double(resultDisplay.text!)!
            resultDisplay.text = String(log10(displayedNumberDouble))
        } else if sender.tag == 23 // percentage
        {
            displayedNumberDouble = Double(resultDisplay.text!)!
            resultDisplay.text = String(displayedNumberDouble * 0.01)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


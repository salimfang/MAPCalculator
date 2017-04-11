//
//  ViewController.swift
//  MAPCalculator
//
//  Created by Salim Fang on 2017/4/11.
//  Copyright © 2017年 Salim Fang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

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
            displayedNumberDouble = Double(resultDisplay.text!)!
            } else if sender.tag == 17 // e
            {
                resultDisplay.text = String(M_E)
                displayedNumberDouble = Double(resultDisplay.text!)!
            } else if sender.tag == 18 // pi
            {
                resultDisplay.text = String(Double.pi)
                displayedNumberDouble = Double(resultDisplay.text!)!
            } else if sender.tag == 20 // plus-minus
            {
                displayedNumberDouble = Double(resultDisplay.text!)! * -1
                resultDisplay.text = String(displayedNumberDouble)
            } else if sender.tag == 24 // decimal mark
            {
                if resultDisplay.text!.contains("."){
                    displayedNumberDouble = Double(resultDisplay.text!)!
                }else if resultDisplay.text == "0"{
                    displayedNumberDouble = Double(resultDisplay.text!)!
                }else{
                    resultDisplay.text = resultDisplay.text! + "."
                    displayedNumberDouble = Double(resultDisplay.text!)!
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
            displayedNumberDouble = Double(resultDisplay.text!)!
            } else if sender.tag == 17 // e
            {
                resultDisplay.text = String(M_E)
                displayedNumberDouble = Double(resultDisplay.text!)!
            } else if sender.tag == 18 // pi
            {
                resultDisplay.text = String(Double.pi)
                displayedNumberDouble = Double(resultDisplay.text!)!
            } else if sender.tag == 20 // plus-minus
            {
                displayedNumberDouble = Double(resultDisplay.text!)! * -1
                resultDisplay.text = String(displayedNumberDouble)
            } else if sender.tag == 24 // decimal mark
            {
                if resultDisplay.text!.contains("."){
                    displayedNumberDouble = Double(resultDisplay.text!)!
                }else if resultDisplay.text == "0"{
                    displayedNumberDouble = Double(resultDisplay.text!)!
                }else{
                    resultDisplay.text = resultDisplay.text! + ".0"
                    displayedNumberDouble = Double(resultDisplay.text!)!
                }
            }
            
        }
    }
    
    
    @IBAction func operationRequested(_ sender: UIButton) {
        if resultDisplay.text !=  "" && sender.tag != 11 && sender.tag != 16{
            
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
            }
            
            operationTapped = sender.tag
            calculationRequested = true
        } else if sender.tag == 16 // equal
        {
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
            }
        } else if sender.tag == 11 // erase
        {
            resultDisplay.text = "0"
            previousTypedNumber = 0
            displayedNumberDouble = 0
            operationTapped = 0
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


//
//  ViewController.swift
//  Calculator
//
//  Created by Eva Marie Bresciano on 5/30/16.
//  Copyright © 2016 Eva Bresciano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var isTyping = false
    
    var stack = Stack()
    
    var displayLabel = UILabel()
    
    var displayValue: Float {
        get {
            let text = displayLabel.text ?? "0"
            return (text as NSString).floatValue
        }
        set {
            displayLabel.text = "\(newValue)"
            isTyping = false
        }
    }
    
    let topLabel = UILabel()
    let zeroButton = UIButton()
    let oneButton = UIButton()
    let twoButton = UIButton()
    let threeButton = UIButton()
    let fourButton = UIButton()
    let fiveButton = UIButton()
    let sixButton = UIButton()
    let sevenButton = UIButton()
    let eightButton = UIButton()
    let nineButton = UIButton()
    let divisionButton = UIButton()
    let additionButton = UIButton()
    let subtractionButton = UIButton()
    let multiplicationButton = UIButton()
    let enterButton = UIButton()
    
    
    static let sharedController = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
        setupConstraints()
    
        displayLabel.textAlignment = .Right
        displayLabel.font = .systemFontOfSize(50.0)
        displayLabel.text = "0"
        displayLabel.textColor = .whiteColor()
        displayLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(displayLabel)
    }
    
    func appendNumber(button: UIButton){
        guard let number = button.currentTitle else {return}
        
        if isTyping {
            let displayText = displayLabel.text ?? ""
            displayLabel.text = displayText + number }
        else { displayLabel.text = number
            isTyping = true
        }
        
    }
    
    func enter() {
        isTyping = false
        stack.push(displayValue)
        stack.log()
    }
    
    func operate(button: UIButton) {
        guard let operation = button.currentTitle else {return}
        
        if isTyping == true {
        return enter()
        }
        
        if stack.count() >= 2 {
            let float1 = stack.pop()!
            let float2 = stack.pop()!
            
            switch operation {
                case "/":
            displayValue = float2 / float1
                case "+":
            displayValue = float2 + float1
                case "*":
            displayValue = float2 * float1
                case "-":
            displayValue = float2 - float1
            default:
                stack.push(float1)
                stack.push(float2)
                
            }
            enter()
        }
        
    }
    
    func setupButtons() {
        
        // set colors
        
        topLabel.backgroundColor = UIColor.blackColor()
        zeroButton.backgroundColor = UIColor.darkGrayColor()
        oneButton.backgroundColor = UIColor.darkGrayColor()
        twoButton.backgroundColor = UIColor.darkGrayColor()
        threeButton.backgroundColor = UIColor.darkGrayColor()
        fourButton.backgroundColor = UIColor.darkGrayColor()
        fiveButton.backgroundColor = UIColor.darkGrayColor()
        sixButton.backgroundColor = UIColor.darkGrayColor()
        sevenButton.backgroundColor = UIColor.darkGrayColor()
        eightButton.backgroundColor = UIColor.darkGrayColor()
        nineButton.backgroundColor = UIColor.darkGrayColor()
        divisionButton.backgroundColor = UIColor.orangeColor()
        additionButton.backgroundColor = UIColor.orangeColor()
        subtractionButton.backgroundColor = UIColor.orangeColor()
        multiplicationButton.backgroundColor = UIColor.orangeColor()
        enterButton.backgroundColor = UIColor .greenColor()
        
        // addButtons
        
        view.addSubview(topLabel)
        view.addSubview(zeroButton)
        view.addSubview(oneButton)
        view.addSubview(twoButton)
        view.addSubview(threeButton)
        view.addSubview(fourButton)
        view.addSubview(fiveButton)
        view.addSubview(sixButton)
        view.addSubview(sevenButton)
        view.addSubview(eightButton)
        view.addSubview(nineButton)
        view.addSubview(divisionButton)
        view.addSubview(additionButton)
        view.addSubview(subtractionButton)
        view.addSubview(multiplicationButton)
        view.addSubview(enterButton)
        
        zeroButton.addTarget(self, action: #selector(appendNumber), forControlEvents: .TouchUpInside)
        oneButton.addTarget(self, action: #selector(appendNumber), forControlEvents: .TouchUpInside)
        twoButton.addTarget(self, action: #selector(appendNumber), forControlEvents: .TouchUpInside)
        threeButton.addTarget(self, action: #selector(appendNumber), forControlEvents: .TouchUpInside)
        fourButton.addTarget(self, action: #selector(appendNumber), forControlEvents: .TouchUpInside)
        fiveButton.addTarget(self, action: #selector(appendNumber), forControlEvents: .TouchUpInside)
        sixButton.addTarget(self, action: #selector(appendNumber), forControlEvents: .TouchUpInside)
        sevenButton.addTarget(self, action: #selector(appendNumber), forControlEvents: .TouchUpInside)
        eightButton.addTarget(self, action: #selector(appendNumber), forControlEvents: .TouchUpInside)
        nineButton.addTarget(self, action: #selector(appendNumber), forControlEvents: .TouchUpInside)
        
        divisionButton.addTarget(self, action: #selector(operate), forControlEvents: .TouchUpInside)
        view.addSubview(divisionButton)
        additionButton.addTarget(self, action: #selector(operate), forControlEvents: .TouchUpInside)
        view.addSubview(additionButton)
        subtractionButton.addTarget(self, action: #selector(operate), forControlEvents: .TouchUpInside)
        view.addSubview(subtractionButton)
        multiplicationButton.addTarget(self, action: #selector(operate), forControlEvents: .TouchUpInside)
        view.addSubview(multiplicationButton)
        
        
        
        zeroButton.setTitle("0", forState: .Normal)
        oneButton.setTitle("1", forState: .Normal)
        twoButton.setTitle("2", forState: .Normal)
        threeButton.setTitle("3", forState: .Normal)
        fourButton.setTitle("4", forState: .Normal)
        fiveButton.setTitle("5", forState: .Normal)
        sixButton.setTitle("6", forState: .Normal)
        sevenButton.setTitle("7", forState: .Normal)
        eightButton.setTitle("8", forState: .Normal)
        nineButton.setTitle("9", forState: .Normal)
        divisionButton.setTitle("/", forState: .Normal)
        additionButton.setTitle("+", forState: .Normal)
        subtractionButton.setTitle("-", forState: .Normal)
        multiplicationButton.setTitle("*", forState: .Normal)
        enterButton.setTitle("=", forState: .Normal)
        
        zeroButton.titleLabel?.font = UIFont(name: "Avenir-Book", size: 28)
        oneButton.titleLabel?.font = UIFont(name: "Avenir-Book", size: 28)
        twoButton.titleLabel?.font = UIFont(name: "Avenir-Book", size: 28)
        threeButton.titleLabel?.font = UIFont(name: "Avenir-Book", size: 28)
        fourButton.titleLabel?.font = UIFont(name: "Avenir-Book", size: 28)
        fiveButton.titleLabel?.font = UIFont(name: "Avenir-Book", size: 28)
        sixButton.titleLabel?.font = UIFont(name: "Avenir-Book", size: 28)
        sevenButton.titleLabel?.font = UIFont(name: "Avenir-Book", size: 28)
        eightButton.titleLabel?.font = UIFont(name: "Avenir-Book", size: 28)
        nineButton.titleLabel?.font = UIFont(name: "Avenir-Book", size: 28)
        divisionButton.titleLabel?.font = UIFont(name: "Avenir-Book", size: 28)
        additionButton.titleLabel?.font = UIFont(name: "Avenir-Book", size: 28)
        subtractionButton.titleLabel?.font = UIFont(name: "Avenir-Book", size: 28)
        multiplicationButton.titleLabel?.font = UIFont(name: "Avenir-Book", size: 28)
        enterButton.titleLabel?.font = UIFont(name: "Avenir-Book", size: 28)

        
        
    }
    
    func setupConstraints() {
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        zeroButton.translatesAutoresizingMaskIntoConstraints = false
        oneButton.translatesAutoresizingMaskIntoConstraints = false
        twoButton.translatesAutoresizingMaskIntoConstraints = false
        threeButton.translatesAutoresizingMaskIntoConstraints = false
        fourButton.translatesAutoresizingMaskIntoConstraints = false
        fiveButton.translatesAutoresizingMaskIntoConstraints = false
        sixButton.translatesAutoresizingMaskIntoConstraints = false
        sevenButton.translatesAutoresizingMaskIntoConstraints = false
        eightButton.translatesAutoresizingMaskIntoConstraints = false
        nineButton.translatesAutoresizingMaskIntoConstraints = false
        divisionButton.translatesAutoresizingMaskIntoConstraints = false
        additionButton.translatesAutoresizingMaskIntoConstraints = false
        subtractionButton.translatesAutoresizingMaskIntoConstraints = false
        multiplicationButton.translatesAutoresizingMaskIntoConstraints = false
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        // top label constraints
        let topLabelWidth = NSLayoutConstraint(item: topLabel, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 1.0, constant: 0)
        let topLabelTopConstraint = NSLayoutConstraint(item: topLabel, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1.0, constant: 0)
        let topLabelHeight = NSLayoutConstraint(item: topLabel, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.25, constant: 0)
        
        // Height and Width
        
        // seven
        let sevenButtonHeightConstraint = NSLayoutConstraint(item: sevenButton, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.1875, constant: 0)
         let sevenButtonWidthConstraint = NSLayoutConstraint(item: sevenButton, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.25, constant: 0)
        
        // eight
        let eightButtonHeightConstraint = NSLayoutConstraint(item: eightButton, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.1875, constant: 0)
        let eightButtonWidthConstraint = NSLayoutConstraint(item: eightButton, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.25, constant: 0)
        // nine
        let nineButtonHeightConstraint = NSLayoutConstraint(item: nineButton, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.1875, constant: 0)
        let nineButtonWidthConstraint = NSLayoutConstraint(item: nineButton, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.25, constant: 0)
        
        // division
        let divisionButtonHeightConstraint = NSLayoutConstraint(item: divisionButton, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.1875, constant: 0)
        let divisionButtonWidthConstraint = NSLayoutConstraint(item: divisionButton, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.25, constant: 0)
        
        // four
        let fourButtonHeightConstraint = NSLayoutConstraint(item: fourButton, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.1875, constant: 0)
        let fourButtonWidthConstraint = NSLayoutConstraint(item: fourButton, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.25, constant: 0)
        
        // five
        let fiveButtonHeightConstraint = NSLayoutConstraint(item: fiveButton, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.1875, constant: 0)
        let fiveButtonWidthConstraint = NSLayoutConstraint(item: fiveButton, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.25, constant: 0)
        
        // six
        let sixButtonHeightConstraint = NSLayoutConstraint(item: sixButton, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.1875, constant: 0)
        let sixButtonWidthConstraint = NSLayoutConstraint(item: sixButton, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.25, constant: 0)
        
        // addition 
        let additionButtonHeightConstraint = NSLayoutConstraint(item: additionButton, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.1875, constant: 0)
        let additionButtonWidthConstraint = NSLayoutConstraint(item: additionButton, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.25, constant: 0)
        
        // one
        let oneButtonHeightConstraint = NSLayoutConstraint(item: oneButton, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.1875, constant: 0)
        let oneButtonWidthConstraint = NSLayoutConstraint(item: oneButton, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.25, constant: 0)
        
        // two
        let twoButtonHeightConstraint = NSLayoutConstraint(item: twoButton, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.1875, constant: 0)
        let twoButtonWidthConstraint = NSLayoutConstraint(item: twoButton, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.25, constant: 0)
        
        // three
        let threeButtonHeightConstraint = NSLayoutConstraint(item: threeButton, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.1875, constant: 0)
        let threeButtonWidthConstraint = NSLayoutConstraint(item: threeButton, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.25, constant: 0)
        
        // subtraction
        let subtractionButtonHeightConstraint = NSLayoutConstraint(item: subtractionButton, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.1875, constant: 0)
        let subtractionButtonWidthConstraint = NSLayoutConstraint(item: subtractionButton, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.25, constant: 0)
        
        // zero
        let zeroButtonHeightConstraint = NSLayoutConstraint(item: zeroButton, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.1875, constant: 0)
        let zeroButtonWidthConstraint = NSLayoutConstraint(item: zeroButton, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.5, constant: 0)
        
        // enter
        let enterButtonHeightConstraint = NSLayoutConstraint(item: enterButton, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.1875, constant: 0)
        let enterButtonWidthConstraint = NSLayoutConstraint(item: enterButton, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.25, constant: 0)
        
        //multiplication
        let multiplicationButtonHeightConstraint = NSLayoutConstraint(item: multiplicationButton, attribute: .Height, relatedBy: .Equal, toItem: view, attribute: .Height, multiplier: 0.1875, constant: 0)
        let multiplicationButtonWidthConstraint = NSLayoutConstraint(item: multiplicationButton, attribute: .Width, relatedBy: .Equal, toItem: view, attribute: .Width, multiplier: 0.25, constant: 0)
        
        view.addConstraints([sevenButtonHeightConstraint,sevenButtonWidthConstraint,eightButtonHeightConstraint, eightButtonWidthConstraint, nineButtonHeightConstraint, nineButtonWidthConstraint, divisionButtonHeightConstraint, divisionButtonWidthConstraint, fourButtonHeightConstraint, fourButtonWidthConstraint, fiveButtonHeightConstraint, fiveButtonWidthConstraint, sixButtonHeightConstraint, sixButtonWidthConstraint, multiplicationButtonHeightConstraint, multiplicationButtonWidthConstraint, oneButtonHeightConstraint, oneButtonWidthConstraint, twoButtonHeightConstraint, twoButtonWidthConstraint, threeButtonHeightConstraint, threeButtonWidthConstraint, subtractionButtonHeightConstraint, subtractionButtonWidthConstraint, zeroButtonHeightConstraint, zeroButtonWidthConstraint, enterButtonHeightConstraint, enterButtonWidthConstraint, additionButtonHeightConstraint, additionButtonWidthConstraint])
    
        
        
        // sevenButton set top and leading constraints
        let sevenButtonTopConstraint = NSLayoutConstraint(item: sevenButton, attribute: .Top, relatedBy: .Equal, toItem: topLabel, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        let sevenButtonLeadingConstraint = NSLayoutConstraint(item: sevenButton, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0)
        
        // eightButton set top and leading
        let eightButtonTopconstraint = NSLayoutConstraint(item: eightButton, attribute: .Top, relatedBy: .Equal, toItem: topLabel, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        let eightButtonLeadingConstraint = NSLayoutConstraint(item: eightButton, attribute: .Leading, relatedBy: .Equal, toItem: sevenButton, attribute: .Trailing, multiplier: 1.0, constant: 0)
        
        //nineButton set top and leading
        let nineButtonTopConstraint = NSLayoutConstraint(item: nineButton, attribute: .Top, relatedBy: .Equal, toItem: topLabel, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        let nineButtonLeadingConstraint = NSLayoutConstraint(item: nineButton, attribute: .Leading, relatedBy: .Equal, toItem: eightButton, attribute: .Trailing, multiplier: 1.0, constant: 0)
        
        //divisionButton set top,leading and trailing
        let divisionButtonTopConstraint = NSLayoutConstraint(item: divisionButton, attribute: .Top, relatedBy: .Equal, toItem: topLabel, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        let divisionButtonTrailingConstraint = NSLayoutConstraint(item: divisionButton, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0)
        
        let divisionButtonLeadingConstraint = NSLayoutConstraint(item: divisionButton, attribute: .Leading, relatedBy: .Equal, toItem: nineButton, attribute: .Trailing, multiplier: 1.0, constant: 0)
        
        //fourButton set top and leading
        let fourButtonTopConstraint = NSLayoutConstraint(item: fourButton, attribute: .Top, relatedBy: .Equal, toItem: sevenButton, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        let fourButtonLeadingConstraint = NSLayoutConstraint(item: fourButton, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0)
        
        //fiveButton set top and leading
        let fiveButtonTopConstraint = NSLayoutConstraint(item: fiveButton, attribute: .Top, relatedBy: .Equal, toItem: eightButton, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        let fiveButtonLeadingConstraint = NSLayoutConstraint(item: fiveButton, attribute: .Leading, relatedBy: .Equal, toItem: fourButton, attribute: .Trailing, multiplier: 1.0, constant: 0)
        
        //sixButton set top and leading constraints
        let sixButtonTopConstraint = NSLayoutConstraint(item: sixButton, attribute: .Top, relatedBy: .Equal, toItem: nineButton, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        let sixButtonLeadingConstraint = NSLayoutConstraint(item: sixButton, attribute: .Leading, relatedBy: .Equal, toItem: fiveButton, attribute: .Trailing, multiplier: 1.0, constant: 0)
        
        //MultiplicationButton set top, leading and trailing constraints
        let multiplicationButtonTopConstraint = NSLayoutConstraint(item: multiplicationButton, attribute: .Top, relatedBy: .Equal, toItem: divisionButton, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        let multiplicationTrailingConstraint = NSLayoutConstraint(item: multiplicationButton, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0)
        
        let multiplicationButtonLeadingConstraint = NSLayoutConstraint(item: multiplicationButton, attribute: .Leading, relatedBy: .Equal, toItem: sixButton, attribute: .Trailing, multiplier: 1.0, constant: 0)
        
        //oneButton set top and leading constraints
        let oneButtonTopConstraint = NSLayoutConstraint(item: oneButton, attribute: .Top, relatedBy: .Equal, toItem: fourButton, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        let oneButtonLeadingConstraint = NSLayoutConstraint(item: oneButton, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0)
        
        //twoButton set top and leading constraints
        let twoButtonTopConstraint = NSLayoutConstraint(item: twoButton, attribute: .Top, relatedBy: .Equal, toItem: fiveButton, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        let twoButtonLeadingConstraint = NSLayoutConstraint(item: twoButton, attribute: .Leading, relatedBy: .Equal, toItem: oneButton, attribute: .Trailing, multiplier: 1.0, constant: 0)
       
        //threeButton set top and leading constraints
        let threeButtonTopConstraint = NSLayoutConstraint(item: threeButton, attribute: .Top, relatedBy: .Equal, toItem: sixButton, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        let threeButtonLeadingConstraint = NSLayoutConstraint(item: threeButton, attribute: .Leading, relatedBy: .Equal, toItem: twoButton, attribute: .Trailing, multiplier: 1.0, constant: 0)
        
        //subtractionButton set top, leading and trailing constraints
        let subtractionButtonTopConstraint = NSLayoutConstraint(item: subtractionButton, attribute: .Top, relatedBy: .Equal, toItem: sixButton, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        let subtractionButtonLeadingConstraint = NSLayoutConstraint(item: subtractionButton, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0)
        
        let subtractionButtonTrailingConstraint = NSLayoutConstraint(item: subtractionButton, attribute: .Leading, relatedBy: .Equal, toItem: threeButton, attribute: .Trailing, multiplier: 1.0, constant: 0)

        // zeroButton set top and leading Constraints
        let zeroButtonLeadingConstraint = NSLayoutConstraint(item: zeroButton, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1.0, constant: 0)
        
        let zeroButtonTopConstraint = NSLayoutConstraint(item: zeroButton, attribute: .Top, relatedBy: .Equal, toItem: oneButton, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        // zeroButton Bottom Constraint
        let zeroButtonBottomConstraint = NSLayoutConstraint(item: zeroButton, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        // enterButton set top and leading Constraints
        let enterButtonLeadingConstraint = NSLayoutConstraint(item: enterButton, attribute: .Leading, relatedBy: .Equal, toItem: zeroButton, attribute: .Trailing, multiplier: 1.0, constant: 0)
        
        let enterButtonTopConstraint = NSLayoutConstraint(item: enterButton, attribute: .Top, relatedBy: .Equal, toItem: twoButton, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        // enterButton Bottom Constraint
        let enterButtonBottomConstraint = NSLayoutConstraint(item: enterButton, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        // additionButton set top, leading and trailing Constraint
        let additonButtonLeadingConstraint = NSLayoutConstraint(item: additionButton, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1.0, constant: 0)
        
        let additionButtonTopConstraint = NSLayoutConstraint(item: additionButton, attribute: .Top, relatedBy: .Equal, toItem: subtractionButton, attribute: .Bottom, multiplier: 1.0, constant: 0)
       
        let additionButtonTrailingConstraint = NSLayoutConstraint(item: additionButton, attribute: .Leading, relatedBy: .Equal, toItem: enterButton, attribute: .Trailing, multiplier: 1.0, constant: 0)
        
        // additionButton Bottom Constraint
        let additionButtonBottomConstraint = NSLayoutConstraint(item: additionButton, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1.0, constant: 0)
        
        
        
        view.addConstraints([topLabelWidth, topLabelTopConstraint, topLabelHeight, sevenButtonTopConstraint, sevenButtonLeadingConstraint, eightButtonTopconstraint, eightButtonLeadingConstraint, nineButtonTopConstraint, nineButtonLeadingConstraint, divisionButtonTopConstraint, divisionButtonTrailingConstraint, fourButtonTopConstraint, fourButtonLeadingConstraint, fiveButtonTopConstraint, fiveButtonLeadingConstraint, sixButtonTopConstraint, sixButtonLeadingConstraint, multiplicationButtonTopConstraint, multiplicationTrailingConstraint, oneButtonTopConstraint, oneButtonLeadingConstraint, twoButtonTopConstraint, twoButtonLeadingConstraint, threeButtonTopConstraint, threeButtonLeadingConstraint, subtractionButtonTopConstraint, subtractionButtonLeadingConstraint, zeroButtonLeadingConstraint, zeroButtonTopConstraint, zeroButtonBottomConstraint, enterButtonLeadingConstraint, enterButtonTopConstraint, enterButtonBottomConstraint, additonButtonLeadingConstraint, additionButtonTopConstraint, additionButtonBottomConstraint, divisionButtonLeadingConstraint, multiplicationButtonLeadingConstraint,subtractionButtonTrailingConstraint, additionButtonTrailingConstraint])
   
    }
}

//zeroButton
//oneButton
//twoButton
//threeButton
//fourButton
//fiveButton
//sixButton
//sevenButton
//eightButton
//nineButton
//divisionButton
//additionButton
//subtractionButton
//multiplicationButton
//enterButton

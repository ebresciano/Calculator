//
//  Stack.swift
//  Calculator
//
//  Created by Eva Marie Bresciano on 5/30/16.
//  Copyright © 2016 Eva Bresciano. All rights reserved.
//

import Foundation

class Stack {
    private var floatsArray = [Float]()
    
    func pop() -> Float? {
        return floatsArray.removeLast()
        
    }
    
    func push(number: Float) {
        floatsArray.append(number)
        
    }
    
    func log() {
        print(floatsArray)
    }
    
    func count() -> Int {
        return floatsArray.count
    }
}
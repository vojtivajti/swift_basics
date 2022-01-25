//
//  main.swift
//  AdvancedOOP
//
//  Created by Михаил Петров on 24.01.2022.
//

import Foundation

/*
 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
 */

struct Queue<T> {
    var elements = [T]()
    
    
    mutating func push (element: T){
        elements.insert(element, at: 0)
    }
    
    mutating func pop() -> T? {
        return elements.removeLast()
    }
    
    func printQueue() {
        print(elements)
    }
    
    subscript(index: Int) -> T? {
        get {
            if index < elements.count - 1 {
                print(elements[index])
                return elements[index]
            }
            print("nil")
            return nil
        }
    }
    
    
//Реализация функции высшего порядка. На примере filter
    func filter (predicate: (T) -> Bool) -> [T] {
        var tmpArray = [T]()
        for element in elements {
            if predicate(element) {
                tmpArray.append(element)
            }
        }
        return tmpArray
    }
}

let isNil: (Int) -> Bool = { (element: Int) -> Bool in
    return element != 0
}


let intArray = [1, 2, 4, 3]

var myArray = Queue(elements: intArray)

myArray.push(element: 0)
myArray.printQueue()
myArray.push(element: 5)
myArray.printQueue()
myArray.push(element: 7)
myArray.printQueue()
myArray.pop()
myArray.printQueue()

print("--------")

print(myArray.filter(predicate: isNil))


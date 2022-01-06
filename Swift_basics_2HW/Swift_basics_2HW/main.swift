//
//  main.swift
//  Swift_basics_2HW
//
//  Created by Михаил Петров on 06.01.2022.
//

import Foundation

//1. Написать функцию, которая определяет, четное число или нет.
print("1. Написать функцию, которая определяет, четное число или нет.")

let a = 5

isEven(number: a)

func isEven (number: Int){
    if number % 2 == 0 {
        print("Число " + String(number) + " - четное")
    } else {
        print("Число " + String(number) + " - не четное")
    }
}

print("")
print("-----------------")

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.
print("2. Написать функцию, которая определяет, делится ли число без остатка на 3.")


let b = 9

isDivideByThree(number: b)

func isDivideByThree (number: Int){
    if number % 3 == 0{
        print("Число " + String(number) + " делится на 3 без остатка")
    } else {
        print("Число " + String(number) + " делится на 3 с остатком")
    }
}

print("")
print("-----------------")


//3. Создать возрастающий массив из 100 чисел.
//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
print("3. Создать возрастающий массив из 100 чисел.")
print("4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.")
print("")

var myArray = [Int]()

for i in (0...99) {
    myArray.append(i)
}

print("Создаем массив:")
print(myArray)

for element in myArray {
    if (element % 2 == 0 || element % 3 != 0), let indexOfElement = myArray.firstIndex(of: element) {
        myArray.remove(at: indexOfElement)
    }
}

print("")
print("Массив без четных числе и чисел не делящихся на 3")
print(myArray)



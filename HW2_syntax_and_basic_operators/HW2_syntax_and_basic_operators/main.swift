//
//  main.swift
//  HW2_syntax_and_basic_operators
//
//  Created by Михаил Петров on 22.01.2022.
//

import Foundation

/*




5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 50 элементов.
Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
b. Пусть переменная p изначально равна двум — первому простому числу.
c. Зачеркнуть в списке числа от 2 + p до n, считая шагом p..
d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
e. Повторять шаги c и d, пока возможно.
*/


let number = 10

//1. Написать функцию, которая определяет, четное число или нет.
isEven(number: number)

func isEven (number: Int) {
    number % 2 == 0 ? print(String(number) + " - Четное") : print(String(number) + " - Не четное")
}

print("--------------------")

//2. Написать функцию, которая определяет, делится ли число без остатка на 3.
isThreeDivide(number: number)

func isThreeDivide(number: Int) {
    number % 3 == 0 ? print(String(number) + " - Делится на 3 без остатка") : print(String(number) + " - Не делится на 3 без остатка")
}

print("--------------------")

//3. Создать возрастающий массив из 100 чисел.

var i = 0
var myArray = [Int]()

while i < 100 {
    myArray.append(i)
    i += 1
}

print(myArray)

//4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
for number in myArray {
    if (number % 2 == 0 || number % 3 == 0), let count = myArray.firstIndex(of: number){
        myArray.remove(at: count)
    }
}

print("Новый массив: ")
print(myArray)


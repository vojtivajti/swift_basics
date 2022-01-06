//
//  main.swift
//  practical task 3
//
//  Created by Михаил Петров on 06.01.2022.
//

import Foundation

/*
1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
*/
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.

struct SportCar {
    let carBrand: String
    let yearOfIssue: Int
    let trunkVolume: Float
    var isEngineStarted: Bool
    var isWindowsOpen: Bool
    var trunkFullSpace: Float
    
    mutating func closeOrOpenWindow(the windowOperation: WindowOperations) {
        switch windowOperation {
        case .open:
            if self.isWindowsOpen {
                print("Окно уже открыто")
            } else {
                self.isWindowsOpen = true
                print("Окно открылось")
            }
        case .close:
            if !self.isWindowsOpen {
                print("Окно уже закрыто")
            } else {
                self.isWindowsOpen = false
                print("Окно закрылось")
            }
        }
    }
    
    mutating func switchOnOffEngine (the engineOpertion: EngineOperations) {
        switch engineOpertion {
        case .on:
            if isEngineStarted {
                print("Двигатель уже заведен")
            } else {
                self.isEngineStarted = true
                print("Двигатель заведен")
            }
        case .off:
            if !isEngineStarted {
                print("Двигатель уже выключен")
            } else {
                self.isEngineStarted = false
                print("Двигатель выключен")
            }
        }
    }
}

struct TrunkCar {
    let carBrand: String
    let yearOfIssue: Int
    let bodyVolume: Float
    var isEngineStarted: Bool
    var isWindowsOpen: Bool
    var bodyFullSpace: Float
}

var bugattiChiron = SportCar(carBrand: "Bugatti", yearOfIssue: 2016, trunkVolume: 10.0, isEngineStarted: false, isWindowsOpen: false, trunkFullSpace: 3.0)
var tatra148 = TrunkCar(carBrand: "Tatra", yearOfIssue: 1990, bodyVolume: 150.0, isEngineStarted: true, isWindowsOpen: false, bodyFullSpace: 140.0)

/*3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.*/

enum EngineOperations {
    case on
    case off
}

enum WindowOperations {
    case open
    case close
}

enum TrunkOperations {
    case download
    case upload
}

/*
5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
6. Вывести значения свойств экземпляров в консоль.
*/

bugattiChiron.closeOrOpenWindow(the: WindowOperations.open)
print(bugattiChiron.isWindowsOpen)

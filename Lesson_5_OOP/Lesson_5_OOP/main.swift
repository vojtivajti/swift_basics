//
//  main.swift
//  Lesson_5_OOP
//
//  Created by Михаил Петров on 19.01.2022.
//
//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
//6. Вывести сами объекты в консоль.


protocol Car {
    var mark: String {get}
    var model: String {get}
    var yearOfIssue: Int {get}
    var color: String {get set}
    var beepSound: String {get}
    var mileage: Float {get set}
    var isEngineStarted: Bool {get set}
    var isWindowOpen: Bool {get set}
    
//    func beeBeep()
//    mutating func startStopEgine()
//    mutating func openCloseWindow()
}

extension Car {
    
    func beeBeep(){
        print(self.mark + self.model + ": " + self.beepSound)
    }
    
    mutating func startStopEngine(the engineOperation: EngineOperations){
        switch engineOperation {
        case .start:
            if self.isEngineStarted {
                print(self.mark + self.model + ": " + "Двигатель уже заведен")
            } else {
                self.isEngineStarted = true
                print(self.mark + self.model + ": " + "Двигатель заведен")
            }
        case .stop:
            if !self.isEngineStarted {
                print(self.mark + self.model + ": " + "Двигатель уже выключен")
            } else {
                self.isEngineStarted = false
                print(self.mark + self.model + ": " + "Двигатель выключен")
            }
        }
        
    }
    
    mutating func openCloseWindow(the windowOperation: WindowOperations){
        switch windowOperation {
        case .open:
            if self.isWindowOpen {
                print(self.mark + self.model + ": " + "Окно уже открыто")
            } else {
                self.isWindowOpen = true
                print(self.mark + self.model + ": " + "Окно открыто")
            }
        case .close:
            if !self.isWindowOpen {
                print(self.mark + self.model + ": " + "Окно уже закрыто")
            } else {
                self.isWindowOpen = false
                print(self.mark + self.model + ": " + "Окно закрыто")
            }
        }
    }
}

class sportCar: Car{
    enum NitroOperations{
        case on
        case off
    }
    
    let accelerationTime: Float
    var isNitroOnOff: Bool
    
    var mark: String
    var model: String
    var yearOfIssue: Int
    var color: String
    var beepSound: String
    var mileage: Float
    var isEngineStarted: Bool
    var isWindowOpen: Bool
    
    init(mark: String, model: String, yearofIssue: Int, color: String, beepSound: String, mileage: Float, isEngineStarted: Bool, isWindowOpen: Bool, accelerationTime: Float, isNitroOnOff: Bool){
        self.mark = mark
        self.model = model
        self.yearOfIssue = yearofIssue
        self.color = color
        self.beepSound = beepSound
        self.mileage = mileage
        self.isEngineStarted = isEngineStarted
        self.isWindowOpen = isWindowOpen
        self.accelerationTime = accelerationTime
        self.isNitroOnOff = isNitroOnOff
    }
    
    func startStopEgine() {
    }
    
    func openCloseWindow() {
    }
    
    func nitroOnOff(the nitroOperation: NitroOperations){
        switch nitroOperation {
        case .on:
            if self.isNitroOnOff {
                print(self.mark + self.model + ": " + "Ускорение уже включено")
            } else {
                self.isNitroOnOff = true
                print(self.mark + self.model + ": " + "Ускорение включено")
            }
        case .off:
            if !self.isNitroOnOff {
                print(self.mark + self.model + ": " + "Ускорение уже выключено")
            } else {
                self.isNitroOnOff = false
                print(self.mark + self.model + ": " + "Ускорение выключено")
            }
        }
    }
}

extension sportCar: CustomStringConvertible{
    var description: String {
        return "Характеристики авто: " +
        self.mark +
        self.model +
        "(Год выпуска: " + String(self.yearOfIssue) +
        ", Пробег: " + String(self.mileage) +
        ", Цвет: " + self.color +
        ", Разгон до 100 км/ч: " + String(self.accelerationTime) + "сек."
    }
}

class trunkCar: Car{
    enum TransmissionOperations{
        case on
        case off
    }
    
    let carryingCapacity: Float
    var isFullDrive: Bool
    
    var mark: String
    var model: String
    var yearOfIssue: Int
    var color: String
    var beepSound: String
    var mileage: Float
    var isEngineStarted: Bool
    var isWindowOpen: Bool
    
    init(mark: String, model: String, yearOfIssue: Int, color: String, beepSound: String, mileage: Float, isEngineStarted: Bool, isWindowOpen: Bool, carryingCapacity: Float, isFullDrive: Bool){
        self.mark = mark
        self.model = model
        self.yearOfIssue = yearOfIssue
        self.color = color
        self.beepSound = beepSound
        self.mileage = mileage
        self.isEngineStarted = isEngineStarted
        self.isWindowOpen = isWindowOpen
        self.carryingCapacity = carryingCapacity
        self.isFullDrive = isFullDrive
    }
    
    func offRoadOnOff(the offRoadOperation: TransmissionOperations){
        switch offRoadOperation {
        case .on:
            if self.isFullDrive {
                print(self.mark + self.model + ": " + "Режим полного привода уже включен")
            } else {
                self.isFullDrive = true
                print(self.mark + self.model + ": " + "Режим полного привода включен")
            }
        case .off:
            if !self.isFullDrive {
                print(self.mark + self.model + ": " + "Режим полного привода уже выключен")
            } else {
                self.isFullDrive = false
                print(self.mark + self.model + ": " + "Режим полного привода выключен")
            }
        }
    }
}

extension trunkCar: CustomStringConvertible{
    var description: String {
        return "Характеристики авто: " +
        self.mark +
        self.model +
        "(Год выпуска: " + String(self.yearOfIssue) +
        ", Пробег: " + String(self.mileage) +
        ", Цвет: " + self.color +
        ", Перевозимый объем: " + String(self.carryingCapacity) + "кг."
    }
}


enum WindowOperations{
    case open
    case close
}

enum EngineOperations{
    case start
    case stop
}

var bugattiChiron = sportCar(mark: "Bugatti",
                             model: "Chiron",
                             yearofIssue: 2016,
                             color: "Blue",
                             beepSound: "Bee-Bee",
                             mileage: 1550.0,
                             isEngineStarted: false,
                             isWindowOpen: false,
                             accelerationTime: 3.2,
                             isNitroOnOff: false)

var kamaz5490 = trunkCar(mark: "KAMAZ",
                         model: "5490",
                         yearOfIssue: 2021,
                         color: "Red",
                         beepSound: "BeeeeeeBeeeeep!",
                         mileage: 50000.0,
                         isEngineStarted: true,
                         isWindowOpen: true,
                         carryingCapacity: 48000.0,
                         isFullDrive: false)
//Проверка работы
bugattiChiron.beeBeep()
print(bugattiChiron.description)
bugattiChiron.openCloseWindow(the: WindowOperations.close)
bugattiChiron.openCloseWindow(the: WindowOperations.open)
bugattiChiron.openCloseWindow(the: WindowOperations.open)
bugattiChiron.startStopEngine(the: EngineOperations.start)
bugattiChiron.nitroOnOff(the: sportCar.NitroOperations.on)

print("----------")

kamaz5490.beeBeep()
print(kamaz5490.description)
kamaz5490.startStopEngine(the: EngineOperations.start)
kamaz5490.openCloseWindow(the: WindowOperations.open)
kamaz5490.offRoadOnOff(the: trunkCar.TransmissionOperations.on)

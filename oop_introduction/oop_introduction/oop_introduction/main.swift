//
//  main.swift
//  oop_introduction
//
//  Created by Михаил Петров on 16.01.2022.
//

import Foundation

class Car {
    let mark: String
    let model: String
    let yearOfIssue: Int
    let trunkVolume: Float
    let equipment: String
    let transmission: String
    var color: String
    var wheelRadius: Float
    var mileage: Float
    var trunkFullSpace: Float
    var isWindowsOpen: Bool
    var isEngineStarted: Bool
    
    init(mark: String, model: String, yearOfIssue: Int, trunkVolume: Float, equipment: String, transmission: String, color: String, wheelRadius: Float, mileage: Float, trunkFullSpace: Float, isWindowsOpen: Bool, isEngineStarted: Bool) {
        self.mark = mark
        self.model = model
        self.yearOfIssue = yearOfIssue
        self.trunkVolume = trunkVolume
        self.equipment = equipment
        self.transmission = transmission
        self.color = color
        self.wheelRadius = wheelRadius
        self.mileage = mileage
        self.trunkFullSpace = trunkFullSpace
        self.isWindowsOpen = isWindowsOpen
        self.isEngineStarted = isEngineStarted
    }
    
    func beeBeep(){
        print("beeBeep!")
    }
    
    func windowOpenClose (the windowOperatinon: WindowOperations){
        switch windowOperatinon {
        case .open:
            if isWindowsOpen {
                print(self.mark + self.model + ": Окно уже открыто")
            } else {
                self.isWindowsOpen = true
                print(self.mark + self.model + ": Окно открыто")
            }
        case .close:
            if isWindowsOpen {
                self.isWindowsOpen = false
                print(self.mark + self.model + ": Окно закрыто")
            } else {
                print(self.mark + self.model + ": Окно уже закрыто")
            }
        }
    }
    
    func engineOnOff (the engineOperation: EngineOperations) {
        switch engineOperation {
        case .on:
            if isEngineStarted {
                print(self.mark + self.model + ": Двигатель уже заведен")
            } else {
                self.isEngineStarted = true
                print(self.mark + self.model + ": Двигатель заведен")
            }
        case .off:
            if isEngineStarted {
                self.isEngineStarted = false
                print(self.mark + self.model + ": Двигатель заглушен")
            } else {
                print(self.mark + self.model + ": Двигатель уже заглушен")
            }
        }
    }
    
    func trunkUpDown (the trunkOperation: TrunkOperatios, volume: Float){
        switch trunkOperation {
        case .download:
            if trunkFullSpace + volume <= trunkVolume {
                trunkFullSpace += volume
                print("В " + self.mark + self.model + " загрузили " + String(volume) + " кг.")
            } else {
                print("В" + self.mark + self.model + " не удалось загрузить " + String(volume) + " кг.")
            }
        case .upload:
            if volume <= trunkFullSpace {
                trunkFullSpace -= volume
                print("Из " + self.mark + self.model + " выгрузили " + String(volume) + " кг.")
            } else {
                trunkFullSpace = 0
                print("Из " + self.mark + self.model + " выгрузили весь груз")
            }
        }
    }
    
}

class sportCar: Car{
    let accelerationTime: Float
    let isExclusive: Bool
    var isNitrogenAccelerator: Bool
    
    init(mark: String, model: String, yearOfIssue: Int, trunkVolume: Float, equipment: String, transmission: String, color: String, wheelRadius: Float, mileage: Float, trunkFullSpace: Float, isWindowsOpen: Bool, isEngineStarted: Bool, accelerationTime: Float, isExclusive: Bool, isNitrogenAccelerator: Bool) {
        self.accelerationTime = accelerationTime
        self.isExclusive = isExclusive
        self.isNitrogenAccelerator = isNitrogenAccelerator
        super.init(mark: mark, model: model, yearOfIssue: yearOfIssue, trunkVolume: trunkVolume, equipment: equipment, transmission: transmission, color: color, wheelRadius: wheelRadius, mileage: mileage, trunkFullSpace: trunkFullSpace, isWindowsOpen: isWindowsOpen, isEngineStarted: isEngineStarted)
    }
    
    override func beeBeep() {
        print(self.mark + self.model + ": Би-би")
    }
    
    func nitroOnOff (the nitroOption: SportCarOperations){
        switch nitroOption {
        case .startNitro:
            if isEngineStarted && !isNitrogenAccelerator {
                isNitrogenAccelerator = true
                print(self.mark + self.model + ": Включена закись азота")
            } else if isNitrogenAccelerator {
                print(self.mark + self.model + ": Закись азота уже включена")
            } else {
                print(self.mark + self.model + ": Перед использованием ускорителя необходимо включить двигатель")
            }
        case .stopNitro:
            if isEngineStarted && isNitrogenAccelerator {
                isNitrogenAccelerator = false
                print(self.mark + self.model + ": Использование закиси азота остановлено")
            } else if !isNitrogenAccelerator {
                print(print(self.mark + self.model + ": Закись азота не используется"))
            } else {
                print(self.mark + self.model + ": Перед использованием ускорителя необходимо включить двигатель")
            }
        }
    }
    
}

class trunkCar: Car{
    let carryingCapacity: Float
    var isFullWheelDrive: Bool
    
    init(mark: String, model: String, yearOfIssue: Int, trunkVolume: Float, equipment: String, transmission: String, color: String, wheelRadius: Float, mileage: Float, trunkFullSpace: Float, isWindowsOpen: Bool, isEngineStarted: Bool, carryingCapacity: Float, isFullWheelDrive: Bool){
        self.carryingCapacity = carryingCapacity
        self.isFullWheelDrive = isFullWheelDrive
        super.init(mark: mark, model: model, yearOfIssue: yearOfIssue, trunkVolume: trunkVolume, equipment: equipment, transmission: transmission, color: color, wheelRadius: wheelRadius, mileage: mileage, trunkFullSpace: trunkFullSpace, isWindowsOpen: isWindowsOpen, isEngineStarted: isEngineStarted)
    }
    
    override func beeBeep() {
        print(self.mark + self.model + ": БИИИИИИИ-БИИИИИИИИИИ")
    }
    
    func fullDrive (the driveMod: TrunkCarOperations){
        switch driveMod {
        case .FullWheelDriveOn:
            if isEngineStarted {
                print(self.mark + self.model + ": Полный привод уже включен")
            } else {
                isFullWheelDrive = true
                print(self.mark + self.model + ": Полный привод подключен")
            }
        case .FullWheelDriveOff:
            if isFullWheelDrive {
                isFullWheelDrive = false
                print(self.mark + self.model + ": Полный привод отключен")
            } else {
                print(self.mark + self.model + ": Полный привод уже отключен")
            }
        }
    }
}

enum WindowOperations {
    case open
    case close
}

enum EngineOperations {
    case on
    case off
}

enum TrunkOperatios {
    case download
    case upload
}

enum SportCarOperations {
    case startNitro
    case stopNitro
}

enum TrunkCarOperations {
    case FullWheelDriveOn
    case FullWheelDriveOff
}


let bugattiChiron = sportCar(mark: "Bugatti",
                             model: "Chiron",
                             yearOfIssue: 2016,
                             trunkVolume: 10.0,
                             equipment: "Sport Racing",
                             transmission: "Manual",
                             color: "Blue",
                             wheelRadius: 19.0,
                             mileage: 12000.0,
                             trunkFullSpace: 8.0,
                             isWindowsOpen: false,
                             isEngineStarted: false,
                             accelerationTime: 3.2,
                             isExclusive: true,
                             isNitrogenAccelerator: true)

let kamaz5490 = trunkCar(mark: "KAMAZ",
                         model: "5490",
                         yearOfIssue: 2021,
                         trunkVolume: 4000.0,
                         equipment: "Кузовной тягач",
                         transmission: "Ручная",
                         color: "Красный",
                         wheelRadius: 22.5,
                         mileage: 3500.0,
                         trunkFullSpace: 12000.0,
                         isWindowsOpen: true,
                         isEngineStarted: true,
                         carryingCapacity: 48000.0,
                         isFullWheelDrive: true)

kamaz5490.beeBeep()
bugattiChiron.beeBeep()

kamaz5490.windowOpenClose(the: WindowOperations.close)
kamaz5490.windowOpenClose(the: WindowOperations.close)

bugattiChiron.engineOnOff(the: EngineOperations.on)
bugattiChiron.trunkUpDown(the: TrunkOperatios.download, volume: 100)
bugattiChiron.trunkUpDown(the: TrunkOperatios.download, volume: 1)
bugattiChiron.trunkUpDown(the: TrunkOperatios.upload, volume: 2)
bugattiChiron.trunkUpDown(the: TrunkOperatios.upload, volume: 200)

bugattiChiron.nitroOnOff(the: SportCarOperations.stopNitro)

kamaz5490.fullDrive(the: TrunkCarOperations.FullWheelDriveOff)

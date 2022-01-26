//
//  main.swift
//  HW7_ErrorProcessing
//
//  Created by Михаил Петров on 26.01.2022.
//

import Foundation

enum EngineOperation {
    case start
    case stop
}

enum WheelType {
    case summerTires
    case winterTires
    case offroadTires
}

enum TravelNavigatorError: Error {
    case wrongRoute //Не верное название маршрута
    case lowBattaryCarge //Низкий заряд батареи (нужно зарядить)
    case insufficientPowerReserve //Недостаточно батареи для маршрута (полного запаса батареи не хватает)
    case wrongWheelType //Не верный тип шин
}

struct Routes {
    let name: String
    let distance: Float
    let coatingType: String
}

class ElectroCar {
    let model: String
    let batteryCapacity: Float
    var chargeLevel: Float
    var wheelType: WheelType
    var isEngineStarted: Bool
    
    init (
        model: String,
        batteryCapacity: Float,
        chargeLevel: Float,
        wheelType: WheelType,
        isEngineStarted: Bool
    ) {
        self.model = model
        self.batteryCapacity = batteryCapacity
        self.chargeLevel = chargeLevel
        self.wheelType = wheelType
        self.isEngineStarted = isEngineStarted
    }
    
    func engineStartStop (the engineOperation: EngineOperation) {
        switch engineOperation {
        case .start:
            guard !isEngineStarted else {
                print("Произошла ошибка - двигатель уже включен!")
                return
            }
            
            print("Двигатель включен")
            
        case .stop:
            guard isEngineStarted else {
                print("Произошла ошибка - двигатель уже выключен!")
                return
            }
            
            print("Двигатель выключен")
        }
    }
    
    func wheelTypeDescription (wheelType: WheelType) -> String{
        switch wheelType {
        case .summerTires:
            return "Асфальт"
        case .winterTires:
            return "Снежное покрытие"
        case .offroadTires:
            return "Бездорожье"
        }
    }
    
    func changeWheelType(wheelType: WheelType) {
        switch wheelType {
        case .summerTires:
            self.wheelType = WheelType.summerTires
            print("Шины заменены. Теперь можно передивагаться по асфальту")
        case .winterTires:
            self.wheelType = WheelType.winterTires
            print("Шины заменены. Теперь можно передивагаться по снежному покрытию")
        case .offroadTires:
            self.wheelType = WheelType.offroadTires
            print("Шины заменены. Теперь можно передивагаться по асфальту")
        }
    }
}

class TravelNavigator {
    let routes = [
        "Красная поляна": Routes(name: "Красная поляна", distance: 101.7, coatingType: "Снежное покрытие"),
        "г. Сочи": Routes(name: "Сочи", distance: 50.0, coatingType: "Асфальт"),
        "о. Рица": Routes(name: "Рица", distance: 70.0, coatingType: "Бездорожье")
    ]
    
    func travelPlanning(selectedCar car: ElectroCar, selectedRoute route: String) throws -> Bool {
        guard let route = routes[route] else {
            throw TravelNavigatorError.wrongRoute
        }
        
        guard car.batteryCapacity >= route.distance else {
            throw TravelNavigatorError.insufficientPowerReserve
        }
        
        guard car.chargeLevel * car.batteryCapacity >= route.distance else {
            throw TravelNavigatorError.lowBattaryCarge
        }
        
        guard car.wheelTypeDescription(wheelType: car.wheelType) == route.coatingType else {
            throw TravelNavigatorError.wrongWheelType
        }
        
        print("На данном автомобиле поездка по маршруту возможна")
        return true
    }
    
}

//Проверяем ошибки на Старт/Стоп двигателя через guard let
var myTesla = ElectroCar(
    model: "TeslaX",
    batteryCapacity: 547,
    chargeLevel: 100,
    wheelType: WheelType.offroadTires,
    isEngineStarted: false
)

myTesla.engineStartStop(the: EngineOperation.stop)
print("------------------------")
print("")

//Проверяем ошибки построения маршрута через throw do/catch
var Car1 = ElectroCar(
    model: "Tesla Model X",
    batteryCapacity: 547,
    chargeLevel: 10.0,
    wheelType: WheelType.summerTires,
    isEngineStarted: false
)

var Car2 = ElectroCar(
    model: "Tesla Model X",
    batteryCapacity: 547,
    chargeLevel: 90.0,
    wheelType: WheelType.winterTires,
    isEngineStarted: false
)

var Car3 = ElectroCar(
    model: "Cybertrack",
    batteryCapacity: 805,
    chargeLevel: 100.0,
    wheelType: WheelType.offroadTires,
    isEngineStarted: true
)

do {
    let travel = try TravelNavigator().travelPlanning(selectedCar: Car3, selectedRoute: "г. Сочи")
} catch TravelNavigatorError.wrongRoute {
    print("Ошибка. Такого маршрута не существует")
} catch TravelNavigatorError.insufficientPowerReserve {
    print("Ошибка. У данного автомобиля не достаточно хода для преодоления данного маршрута")
} catch TravelNavigatorError.lowBattaryCarge {
    print("Ошибка. Для преодоления данного маршрута следует зарядить батарею")
} catch TravelNavigatorError.wrongWheelType {
    print("Ошибка. Для преодоления данного маршрута следует сменить тип шин")
}

Car3.changeWheelType(wheelType: .summerTires)

do {
    let travel = try TravelNavigator().travelPlanning(selectedCar: Car3, selectedRoute: "г. Сочи")
} catch TravelNavigatorError.wrongRoute {
    print("Ошибка. Такого маршрута не существует")
} catch TravelNavigatorError.insufficientPowerReserve {
    print("Ошибка. У данного автомобиля не достаточно хода для преодоления данного маршрута")
} catch TravelNavigatorError.lowBattaryCarge {
    print("Ошибка. Для преодоления данного маршрута следует зарядить батарею")
} catch TravelNavigatorError.wrongWheelType {
    print("Ошибка. Для преодоления данного маршрута следует сменить тип шин")
}

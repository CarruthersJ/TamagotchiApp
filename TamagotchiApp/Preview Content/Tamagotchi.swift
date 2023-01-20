//
//  TamagotchiClass.swift
//  TamagotchiIOSApp
//
//  Created by Carruthers, James (EJNR) on 14/01/2023.
//

import Foundation

class Tamagotchi: ObservableObject {
    @Published private var hunger: Int
    @Published private var happiness: Double
    @Published private var isTired: Bool
    private let name: String
    @Published private var age: Int
    private var isSick: Bool
    
    init(name: String) {
        var chosenName = String()
        if name == "" {
            chosenName = Tamagotchi.chooseName()
        } else {
            chosenName = name
        }
        self.name = chosenName
        self.hunger = 5
        self.happiness = 3.0
        self.isTired = false
        self.age = 0
        self.isSick = false
    }
    
    func displayStats() -> (hunger: Int, happiness: Double, isTired: Bool, name: String, age: Int, isSick: Bool) {
        let statList = (hunger: self.hunger, happiness: self.happiness, isTired: self.isTired, name: self.name, age: self.age, isSick: self.isSick)
        return statList
    }
    
    static func chooseName() -> String {
        let tamagotchiNameStruct = TamagotchiNameList()
        let listOfNames = tamagotchiNameStruct.tamagotchiNames
        let randomIndex = Int.random(in: 0 ... listOfNames.count)
        let randomName = listOfNames[randomIndex]
        return randomName
    }
}

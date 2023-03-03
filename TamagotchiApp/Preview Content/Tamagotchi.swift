//
//  TamagotchiClass.swift
//  TamagotchiIOSApp
//
//  Created by Carruthers, James (EJNR) on 14/01/2023.
//

import Foundation

class Tamagotchi: ObservableObject {
    @Published private var hunger: Int
    @Published var happiness: Double
    @Published private var isTired: Bool
    let name: String
    @Published private var age: Int
    @Published private var isSick: Bool
    @Published private var isDead : Bool
    
    
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
        self.isDead = false
    }
    
    func displayStats() -> (hunger: Int, happiness: Double, isTired: Bool, name: String, age: Int, isSick: Bool, isDead: Bool) {
        let statList = (hunger: self.hunger, happiness: self.happiness, isTired: self.isTired, name: self.name, age: self.age, isSick: self.isSick, isDead: self.isDead)
        return statList
    }
    
    static func chooseName() -> String {
        let tamagotchiNameStruct = TamagotchiNameList()
        let listOfNames = tamagotchiNameStruct.tamagotchiNames
        let randomIndex = Int.random(in: 0 ..< listOfNames.count)
        let randomName = listOfNames[randomIndex]
        return randomName
    }
    
    func feedSnack() {
        if self.hunger < 20 && self.hunger > 0 {
            self.hunger -= 1
        }
    }
    
    func feedMeal() {
        if self.hunger < 20 && self.hunger > 5 {
            self.hunger -= 5
        } else if self.hunger <= 5 {
            self.hunger = 0
        }
    }
    
    func increaseHunger(_ amountToIncrease: Int) {
        if self.hunger < 20 - amountToIncrease {
            hunger += amountToIncrease
        } else {
            self.isDead = true
        }
    }
    
    func requestHunger() -> Int {
        return self.hunger
    }
    
    func die() {
        self.isDead = true
    }
    
    func getOlder() {
        self.age += 1
    }
    
    func requestAge() -> Int {
        return self.age
    }
    
    func playGame() {
        self.happiness += 0.5
    }
}

//
//  TamagotchiClass.swift
//  TamagotchiIOSApp
//
//  Created by Carruthers, James (EJNR) on 14/01/2023.
//

import Foundation

class TamagotchiClass {
    private var hunger: Int
    private var happiness: Double
    private var isTired: Bool
    private let name: String
    private var age: Int
    private var isSick: Bool
    
    init(name: String) {
        self.hunger = 5
        self.happiness = 3.0
        self.isTired = false
        self.name = name
        self.age = 0
        self.isSick = false
    }
    
    func displayStats() -> (hunger: Int, happiness: Double, isTired: Bool, name: String, age: Int, isSick: Bool) {
        let statList = (hunger: self.hunger, happiness: self.happiness, isTired: self.isTired, name: self.name, age: self.age, isSick: self.isSick)
        return statList
    }
}

//
//  TamagotchiAppTests.swift
//  TamagotchiAppTests
//
//  Created by Carruthers, James (EJNR) on 14/01/2023.
//

import XCTest
@testable import TamagotchiIOSApp

class TamagotchiAppTests: XCTestCase {

    func testThatTamagotchiInitialisesWithBaseLevelsOfAttributes() {
        let tamagotchi = Tamagotchi(name: "Tamagotchi")
        let tamagotchiAttributes = tamagotchi.displayStats()
        
        let expectedHunger = 5
        let expectedHappiness = 3.0
        let expectedIsTired = false
        let expectedName = "Tamagotchi"
        let expectedAge = 0
        let expectedIsSick = false
        
        XCTAssertEqual(tamagotchiAttributes.hunger, expectedHunger)
        XCTAssertEqual(tamagotchiAttributes.happiness, expectedHappiness)
        XCTAssertEqual(tamagotchiAttributes.isTired, expectedIsTired)
        XCTAssertEqual(tamagotchiAttributes.name, expectedName)
        XCTAssertEqual(tamagotchiAttributes.age, expectedAge)
        XCTAssertEqual(tamagotchiAttributes.isSick, expectedIsSick)
    }

}

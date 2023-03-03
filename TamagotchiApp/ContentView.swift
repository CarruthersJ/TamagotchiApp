//
//  ContentView.swift
//  TamagotchiApp
//
//  Created by Carruthers, James (EJNR) on 14/01/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var tamagotchi = Tamagotchi(name: "")
    @State private var timeToFeed = 5
    @State private var timeAlive = 0
    @State private var gameCooldown = 20
    @State private var happinessTimer = 5
    @State private var mealCooldown = 10
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        let stats = tamagotchi.displayStats()
        if stats.isDead == true {
            DeathScreenView()
        }
        else {
            Form {
                VStack {
                    Text("Your Tamagotchi is called \(tamagotchi.name)")
                    }
                Section(header: Text("Stats")) {
                    VStack(alignment: .leading) {
                        Text("Hunger: \(stats.hunger)")
                        Text("Happiness: \(stats.happiness)")
                        if stats.isTired {
                            Text("Your Tamagotchi is tired")
                        } else {
                            Text("Your Tamagotchi is not tired")
                        }
                        Text("Age: \(stats.age)")
                        if stats.isSick {
                            Text("Your Tamagotchi is sick")
                        } else {
                            Text("Your Tamagotchi is not sick")
                        }
                    }
                }
                Section(header: Text("FUNCTIONS")) {
                    VStack(alignment: .leading) {
                        Button("Feed Tamagotchi snack") {
                            tamagotchi.feedSnack()
                        }
                        Divider()
                        Button("Feed Tamagotchi meal") {
                            if mealCooldown == 0 {
                                tamagotchi.feedMeal()
                                mealCooldown = 10
                            }
                            
                        }
                        Divider()
                        Button("Play with Tamagotchi") {
                            if gameCooldown == 0 {
                                tamagotchi.playGame()
                                gameCooldown = 20
                            }
                            
                        }
                    }
                    
                }
                Section(header: Text("Timers")) {
                    VStack(alignment: .leading) {
                        Text("Time until hungry: \(timeToFeed)")
                            .onReceive(timer) { _ in
                                if tamagotchi.requestHunger() == 20 {
                                    tamagotchi.die()
                                    
                                } else {
                                    if self.timeToFeed > 0 {
                                        self.timeToFeed -= 1
                                    } else {
                                        self.timeToFeed = 5
                                        tamagotchi.increaseHunger(3)
                                    }
                                }
                                if happinessTimer > 0 {
                                    happinessTimer -= 1
                                } else if happinessTimer == 0 {
                                    happinessTimer = 5
                                    tamagotchi.happiness -= 0.1
                                }
                                        
                            }
                        Text("Age: \(stats.age)")
                            .onReceive(timer) { _ in
                                if tamagotchi.requestAge() == 20 {
                                    tamagotchi.die()
                                }
                                timeAlive += 1
                                if timeAlive % 5 == 0 {
                                    tamagotchi.getOlder()
                                }
                                        
                            }
                        Text("Cooldown for playing a game: \(gameCooldown)")
                            .onReceive(timer) { _ in
                                if gameCooldown > 0 {
                                    gameCooldown -= 1
                                }
                            }
                        Text("Cooldown for feeding a meal: \(mealCooldown)")
                            .onReceive(timer) { _ in
                                if mealCooldown > 0 {
                                    mealCooldown -= 1
                                }
                            }
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

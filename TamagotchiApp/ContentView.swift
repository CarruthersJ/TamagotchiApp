//
//  ContentView.swift
//  TamagotchiApp
//
//  Created by Carruthers, James (EJNR) on 14/01/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var tamagotchi = Tamagotchi(name: "")
    @State private var timeToFeed = 15
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        var stats = tamagotchi.displayStats()
        if stats.isDead == true {
            NavigationLink("", destination: DeathScreenView)
        }
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
                Button("Feed Tamagotchi") {
                    tamagotchi.feed()
                }
            }
            Section(header: Text("Timers")) {
                VStack {
                    Text("Time until hungry: \(timeToFeed)")
                        .onReceive(timer) { _ in
                            if tamagotchi.requestHunger() == 20 {
                                tamagotchi.die()                            }
                            if self.timeToFeed > 0 {
                                self.timeToFeed -= 1
                            } else {
                                self.timeToFeed = 15
                                tamagotchi.increaseHunger(3)
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

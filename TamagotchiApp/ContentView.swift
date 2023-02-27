//
//  ContentView.swift
//  TamagotchiApp
//
//  Created by Carruthers, James (EJNR) on 14/01/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var tamagotchi = Tamagotchi(name: "")
    
    var body: some View {
        var stats = tamagotchi.displayStats()
        Form {
            VStack {
                Text("Your Tamagotchi is called \(tamagotchi.name)")
            }
            Section(header: Text("Stats")) {
                VStack {
                    Text("Hunger: \(stats.hunger)")
                        .multilineTextAlignment(.leading)
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
                .frame(alignment: .leading)
            }
            .frame(alignment: .leading)
        }
        .frame(alignment: .leading)
        
                
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

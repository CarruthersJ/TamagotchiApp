//
//  DeathScreen.swift
//  TamagotchiIOSApp
//
//  Created by Jamie Carruthers on 28/02/2023.
//

import Foundation
import SwiftUI

struct DeathScreenView : View {
    @State var makeNewTamagotchi: Bool = false
    var body: some View {
        if makeNewTamagotchi == false {
            VStack {
                Text("Your Tamagotchi has died")
                Button("Play again with new Tamagotchi") {
                    makeNewTamagotchi = true
                }
            }
        } else {
            ContentView()
        }
    }
}



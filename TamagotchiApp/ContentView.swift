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
        VStack {
            Text("")
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

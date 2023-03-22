//
//  ContentView.swift
//  SteinScherrePapier
//
//  Created by Elias Breitenbach on 20.03.23.
//

import SwiftUI

struct ContentView: View {
    let choice = ["👊🏽", "✌🏽", "🫲🏽"].shuffled()
    let win = ["Win", "Lose"].shuffled()
    
    @State private var currentChoice = false
    @State private var loseOrWinv = false
    @State private var weißNochNicht = Bool.random()
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.1), location: 0.6),
                .init(color: Color(red: 0.2, green: 0.1, blue: 0.2), location: 0.8),
            ], center: .top, startRadius: 200, endRadius: 500)
            .ignoresSafeArea()
            VStack {
                
                Button("👊🏽") {
                    
                }
                .font(.system(size: 200))
                .shadow(radius: 9)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

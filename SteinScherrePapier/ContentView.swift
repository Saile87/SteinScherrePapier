//
//  ContentView.swift
//  SteinScherrePapier
//
//  Created by Elias Breitenbach on 20.03.23.
//

import SwiftUI

struct ContentView: View {
    @State private var deineWahl = ["👊🏽", "✌🏽", "✋🏽"]
    @State private var deineTextWahl = ["Stein", "Schere", "Papier"]
    @State private var win = ["Win", "Lose"]
    @State private var controlingGameRound = false
    @State private var currentChoice = false
    @State private var loseOrWin = false
    @State private var SSP = Int.random(in: 0..<2)
    @State private var counter = 0

    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.1), location: 0.6),
                .init(color: Color(red: 0.2, green: 0.1, blue: 0.2), location: 0.8),
            ], center: .top, startRadius: 200, endRadius: 500)
            .ignoresSafeArea()
            VStack {
                Spacer()
                Spacer()
                Text(deineWahl[SSP])
                VStack {
                    Text(deineTextWahl[SSP])
                        .foregroundColor(.white)
                }
                VStack {
                    Button(loseOrWin ? (win[0]) : (win[1])) {
                        loseOrWin.toggle()
                    }
                    .foregroundColor(loseOrWin ? .red : .green)
                    Spacer()
                }
                HStack {
                    Button("👊🏽") {
                    }
                    Button("✌🏽") {
                    }
                    Button("✋🏽") {
                    }
                }
                .padding()
            }
            .padding()
        }
        .font(.system(size: 50))
        .shadow(radius: 4)
    }
}
    
//    func steinScherePapier() {
//        deineWahl.shuffle()
//        weißNochNicht = Bool.random()
//    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

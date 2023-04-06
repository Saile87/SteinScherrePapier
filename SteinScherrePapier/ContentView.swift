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
    @State private var scoreTitle = ""
    
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
                        self.counter += 1
                        if self.counter >= 8 {
                            self.controlingGameRound = true
                        }
                    
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
        
        .alert(scoreTitle, isPresented: $controlingGameRound) {
            Button("Continue", action: newRound)
        } message: {
            Text("Your Score is: \(counter)")
            
        }
    }
    func buttonTapped(_ number: Int) {
        if number == SSP {
            scoreTitle = "Correct"
        } else if number != SSP {
            scoreTitle = ("Wrong that's flag of:")
        }
        loseOrWin = true
    }
    func newRound() {
        deineWahl.shuffle()
        SSP = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

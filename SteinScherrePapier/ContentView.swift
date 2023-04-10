//
//  ContentView.swift
//  SteinScherrePapier
//
//  Created by Elias Breitenbach on 20.03.23.
//

import SwiftUI

struct ContentView: View {
    @State private var deineWahl = ["👊🏽", "✌🏽", "✋🏽"]
    @State private var textWahl = ["Stein", "Schere", "Papier"]
    @State private var win = ["Win", "Lose"]
    @State private var controlingGameRound = false
    @State private var loseOrWin = false
    @State private var randomSSP = Int.random(in: 0..<2)
    @State private var counter = 0
    @State private var scoreTitle = ""
    @State private var score = 0
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                
                .init(color: Color(red: 0.0, green: 0.0, blue: 0.0), location: 0.6),
                .init(color: Color(red: 0.0, green: 0.0, blue: 0.0), location: 0.8),
            ], center: .top, startRadius: 200, endRadius: 500)
            .ignoresSafeArea()
            VStack {
                Spacer()
                Spacer()
                Text(deineWahl[randomSSP])
                VStack {
                    Text(textWahl[randomSSP])
                        .foregroundColor(.white)
                }
                VStack {
                    Text(loseOrWin ? (win[0]) : (win[1]))
                        .foregroundColor(loseOrWin ? .red : .green)
                    Spacer()
                    
                    Text("Score \(score)")
                        .foregroundColor(.white)
                        .font(.title.bold())
                    
                    Spacer()
                }
                HStack {
                    Button("👊🏽") {
                        Game()
                        loseOrWin.toggle()
                        newRound()
                        self.counter += 1
                        if self.counter >= 44 {
                            self.controlingGameRound = true
                            score = 0
                            counter = 0
                        }
                        
                    }
                    Button("✌🏽") {
                        Game()
                        loseOrWin.toggle()
                        newRound()
                        self.counter += 1
                        if self.counter >= 44 {
                            self.controlingGameRound = true
                            score = 0
                            counter = 0
                        }
                    }
                    Button("✋🏽") {
                        Game()
                        loseOrWin.toggle()
                        newRound()
                        self.counter += 1
                        if self.counter >= 44 {
                            self.controlingGameRound = true
                            score = 0
                            counter = 0
                        }
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

    func Game() {
        if deineWahl == ["✋🏽"] {
           
                score += 1
            } else {
                score -= 1
            }
        
    }
    func newRound() {
        randomSSP = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

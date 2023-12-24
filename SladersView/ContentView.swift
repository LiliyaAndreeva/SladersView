//
//  ContentView.swift
//  SladersView
//
//  Created by Лилия Андреева on 23.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var randomNumber = Double.random(in: 0...100)
    @State private var slidersValue: Double = 50
    @State private var alertPresented = false
    @State private var score = 0

   
    
    var body: some View {
        VStack {
           Text("Подвиньте слайдер как можно ближе к: \(Int(randomNumber))" )
                .padding(.bottom, 40)
            HStack {
                Text("0")
                UISliderRepresentation(slidersValue: $slidersValue, opacity: Double(computeScore())/100)
                Text("100")
            }
            .padding(.bottom, 20)
            ButtonView(title: "Проверь меня", action: {
                score = computeScore()
                alertPresented.toggle()
            })
            .alert(isPresented: $alertPresented) {
                Alert(
                    title: Text("Your score: "),
                    message: Text("\(score)"),
                    dismissButton: .default(Text("OK"))
                )
            }
                .padding(.bottom, 20)
            ButtonView(title: "Начать заново", action: {
                restart()
            })
        }
        .padding()
    }
    
    
    private func computeScore() -> Int {
        let difference = abs(slidersValue - randomNumber)
        return 100 - Int(difference)
    }


    private func restart() {
        randomNumber = Double.random(in: 0...100)
        slidersValue = 0
    }
}

#Preview {
    ContentView()
}

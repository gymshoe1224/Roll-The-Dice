//
//  ContentView.swift
//  Roll The Dice
//
//  Created by Chris Markiewicz on 9/9/22.
//

import SwiftUI

struct ContentView: View {
    @State private var randomValue = 0
    @State private var rotation = 0.0
    var body: some View {
        Text("Dice Roll")
            .font(.largeTitle)
            .padding()
        Image("pips \(randomValue)")
            .resizable()
            .frame(width: 200.0, height: 200.0, alignment: .center)
            .rotationEffect(.degrees(rotation))
            .rotation3DEffect(.degrees(rotation), axis: (x: 1, y: 1, z: 0))
            .padding()
            .onTapGesture {
                chooseRandom(times: 3)
                withAnimation(.interpolatingSpring(stiffness: 10, damping: 2)) {
                    rotation += 360
                }
            }
        Spacer()
    }
    func chooseRandom(times: Int) {
        if times > 0 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                randomValue = Int.random(in: 1...6)
                chooseRandom(times: times - 1)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

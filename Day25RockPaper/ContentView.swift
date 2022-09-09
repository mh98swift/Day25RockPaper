//
//  ContentView.swift
//  Day25RockPaper
//
//  Created by VCM1 on 09/09/2022.
//

import SwiftUI

//struct customButton: View{
//    @State var title: String
//    var selected: String
//    var body: some View{
//        Button(title){
//            print("\(title) = \(selected)")
//        }.font(.system(size: 60).weight(.heavy))
//    }
//}

struct ContentView: View {

    let rockPaperPaper = ["Rock 🪨", "Paper 🧻", "Scissors ✂️"]
    @State var score = 0
    @State var result = ""
    @State var subResult = ""
    @State var opponentSelection = ""
    @State var yourSelection = ""
    
    var body: some View {
        //3 button choose to click
        VStack{
            ForEach(0..<3){ number in
                Button(rockPaperPaper[number]){
                    buttonWasTap(rockPaperPaper[number])}.font(.system(size: 60).weight(.heavy))
                    .padding()
            }
            VStack{
                HStack{
                    Text("You: ")
                        .font(.system(size: 30).weight(.heavy))
                    Text(yourSelection)
                        .font(.system(size: 30).weight(.heavy))
                        .foregroundColor(.blue)
                }
                .padding()
                HStack{
                    Text("Bot: ")
                        .font(.system(size: 30).weight(.heavy))
                    Text(opponentSelection)
                        .font(.system(size: 30).weight(.heavy))
                        .foregroundColor(.blue)
                }
            }
            .padding()
//            Text("result: \(result)")
//                .font(.system(size: 30))
//                .padding()
            Text("score: \(score)")
                .font(.system(size: 30))
        }
    }
    
    func buttonWasTap(_ selected: String){
        
        let randomRockPaperPaper = ["Rock 🪨", "Paper 🧻", "Scissors ✂️"].shuffled()
        guard let selectedLast = selected.last else {return}
        guard let randomRockPaperPaperLast = randomRockPaperPaper[0].last else {return}
        
        opponentSelection = "\(randomRockPaperPaperLast)"
        yourSelection = "\(selectedLast)"
        
        if randomRockPaperPaper[0] == selected{
            print ("Try agin - \(selected) is the same \(randomRockPaperPaper[0])")
            
            result = "Try agin"
            subResult = "\(selected) is the same \(randomRockPaperPaper[0])"
        }
        
        if selected == "Rock 🪨" && randomRockPaperPaper[0] == "Paper 🧻" {
            print ("You lost - \(randomRockPaperPaper[0]) Wraps \(selected)")
            result = "You lost - \(randomRockPaperPaper[0]) Wraps \(selected)"
        }
        
        else if selected == "Rock 🪨" && randomRockPaperPaper[0] == "Scissors ✂️" {
            print ("You won - \(selected ) Break \(randomRockPaperPaper[0])")
            score += 1
            result = "You won - \(selected ) Break \(randomRockPaperPaper[0])"
        }
        
        
        if selected == "Paper 🧻" && randomRockPaperPaper[0] == "Rock 🪨" {
            print ("You won - \(selected) Wraps \(randomRockPaperPaper[0])")
            result = "You won - \(selected) Wraps \(randomRockPaperPaper[0])"
            score += 1
        }
        
        else if selected == "Paper 🧻" && randomRockPaperPaper[0] == "Scissors ✂️" {
            print ("You lost - \(randomRockPaperPaper[0]) cut \(selected)")
            result = "You lost - \(randomRockPaperPaper[0]) cut \(selected)"
        }
        
        if selected == "Scissors ✂️" && randomRockPaperPaper[0] == "Rock 🪨" {
            print ("You lost - \(randomRockPaperPaper[0]) break \(selected)")
            result = "You lost - \(randomRockPaperPaper[0]) break \(selected)"
        }
        
        else if selected == "Scissors ✂️" && randomRockPaperPaper[0] == "Paper 🧻" {
            print ("You won - \(selected) cut \(randomRockPaperPaper[0])")
            result = "You won - \(selected) cut \(randomRockPaperPaper[0])"
            score += 1
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

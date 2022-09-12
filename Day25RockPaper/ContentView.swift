//
//  ContentView.swift
//  Day25RockPaper
//
//  Created by VCM1 on 09/09/2022.
//

import SwiftUI


struct ContentView: View {

    let rockPaperPaper = ["Rock 🪨", "Paper 🧻", "Scissors ✂️"]
    @State var yourScore = 0
    @State var botScore = 9

    @State var result = ""
    @State var opponentSelection = ""
    @State var yourSelection = ""
    
    var body: some View {
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
                    Text("\(yourScore)")
                        .font(.system(size: 30).weight(.heavy)).foregroundColor(.indigo)
                }
                .padding()
                HStack{
                    Text("Bot: ")
                        .font(.system(size: 30).weight(.heavy))
                    Text(opponentSelection)
                        .font(.system(size: 30).weight(.heavy))
                        .foregroundColor(.blue)
                    Text("\(botScore)")
                        .font(.system(size: 30).weight(.heavy)).foregroundColor(.indigo)
                }
            }
            .padding()
            
            Text(result)
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
        }
        
        if selected == "Rock 🪨" && randomRockPaperPaper[0] == "Paper 🧻" {
            print ("You lost - \(randomRockPaperPaper[0]) Wraps \(selected)")
            botScore += 1
        }
        
        else if selected == "Rock 🪨" && randomRockPaperPaper[0] == "Scissors ✂️" {
            print ("You won - \(selected ) Break \(randomRockPaperPaper[0])")
            yourScore += 1
        }
        
        
        if selected == "Paper 🧻" && randomRockPaperPaper[0] == "Rock 🪨" {
            print ("You won - \(selected) Wraps \(randomRockPaperPaper[0])")
            yourScore += 1
        }
        
        else if selected == "Paper 🧻" && randomRockPaperPaper[0] == "Scissors ✂️" {
            print ("You lost - \(randomRockPaperPaper[0]) cut \(selected)")
            botScore += 1
        }
        
        if selected == "Scissors ✂️" && randomRockPaperPaper[0] == "Rock 🪨" {
            print ("You lost - \(randomRockPaperPaper[0]) break \(selected)")
            botScore += 1
        }
        
        else if selected == "Scissors ✂️" && randomRockPaperPaper[0] == "Paper 🧻" {
            print ("You won - \(selected) cut \(randomRockPaperPaper[0])")
            yourScore += 1
        }
        
        if botScore == 10{
            result = "Game Over... You Lost 🙁"
            botScore = 0
            yourScore = 0
        }
        if yourScore == 10{
            result = "Game Over... You Won 😀"
            botScore = 0
            yourScore = 0
        }
        if botScore == 1 || yourScore == 1{
            result = ""
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  MultiplyBy
//
//  Created by megared on 15/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

struct GameView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            Text("Correct")
            Text("3 x 12")
            Text("=")
            Text("36")
            Button("back") {
                 self.presentationMode.wrappedValue.dismiss()
             }
        }
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

struct ContentView: View {
    let timesTables = TimesTable(number: 12).all
    
    @State private var showingSheet = false
    @State private var numberOfQuestions = "0"
    @State private var questions = [String]()
    @State private var selectedTables = [[Int]]()
    
    var body: some View {
        
            VStack {
                Spacer()
                VStack {
                    Text("Multiply Game")
                    HStack {
                        Text("number of question: ")
                        TextField("number of question", text: $numberOfQuestions)
                    }
                }
                
                ForEach(self.timesTables.chunked(into: 3), id: \.number) {row in
                    HStack {
                        ForEach(row, id: \.self) {_ in
                            ColoredButtonView(table: 3)
                        }
                    }
                }
                
                
                Spacer()
                Button("Play") {
                    self.showingSheet.toggle()
                    self.play()
                }
                .sheet(isPresented: $showingSheet) {
                    GameView()
                }
        }.padding()
        
    }
    
//    func addTable(of table: String) {
//        selectedTables += tables[String]
//    }
    
    func play() {
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

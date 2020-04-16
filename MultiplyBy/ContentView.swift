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
    let timesTables = TimesTables(number: 14).allTables
    
    @State private var showingSheet = false
    @State private var numberOfQuestions = "0"
    @State private var questions = [String]()
    @State private var selectedTables = [[Int]]()
    
    
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Spacer()
                VStack {
                    Image("title")
                    HStack {
                        Text("number of question: ")
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                        TextField("number of question", text: self.$numberOfQuestions)
                            .font(.system(size: 16, weight: .bold, design: .rounded))
                    }
                }
                ScrollView() {
                    VStack(spacing: 8) {
                        ForEach(self.timesTables.chunked(into: 3), id: \.self) { row in
                            HStack(spacing: 8) {
                                ForEach(row, id: \.self) { table in
                                    ColoredButtonView(table: table.id)
                                    .frame(width: geo.size.width / 3.2)
                                }
                            }.frame(height: geo.size.width / 3.2)
                        }
                    }
                }
                
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        // add action
                    }, label: {
                        Image("learn")
                            .renderingMode(.original)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 70)
                    })
                    Spacer()
                    Button(action: {
                        self.showingSheet.toggle()
                        self.play()
                    }, label: {
                        Image("play")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 70)
                    })
                     Spacer()
                }
                
                .sheet(isPresented: self.$showingSheet) {
                    GameView()
                }
            }
        }.frame(maxWidth: 400)
        .padding(.horizontal, 40)
        
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

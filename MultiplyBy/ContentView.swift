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
    private var cornerRadius: CGFloat = 8
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .frame(maxWidth: .infinity, maxHeight: .infinity + 100)
                .foregroundColor(Color.red)
                .overlay(
                    RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(Color.blue, lineWidth: 8)
                        
            ).edgesIgnoringSafeArea(.all)
            
            
            VStack {
                Text("Correct")
                Text("3 x 12")
                Text("=")
                Text("36")
                Button("back") {
                    self.presentationMode.wrappedValue.dismiss()
                }.shadow(color: .red, radius: 5, x: 0, y: -5)
            }.shadow(color: .red, radius: 5, x: 0, y: -5)
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
    let timesTables = TimesTables(number: 12).allTables
    
    @State private var showingSheet = false
    @State private var numberOfQuestions = "0"
    @State private var questions = [String]()
    @State private var selectedTables = [[Int]]()
    @State private var tables: String = ""
    
    
    private var disableScrolling: Bool {
        if timesTables.count > 12 {
            return false
        }
        return true
    }
    
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
                    Text("selected tables: \(self.tables)")
                    Text("Button All TimesTables + Settings + Scores")
                }
                ScrollView(self.disableScrolling ? [] : .vertical) {
                    VStack(spacing: 8) {
                        ForEach(self.timesTables.chunked(into: 3), id: \.self) { row in
                            HStack(spacing: 8) {
                                ForEach(row, id: \.self) { table in
                                    Button(action: {
                                        print("test button pressed is \(table.id)")
                                    }, label: {
                                        Text("\(table.id)")
                                    })
                                        .buttonStyle(ColoredButtonStyle(table: table.id))
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
    
    func addTable(of table: String) {
        tables.append(table)
    }
    
    func play() {
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

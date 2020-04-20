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

struct PrimaryLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 30, weight: .bold, design: .rounded))
            .foregroundColor(.black)
    }
}

struct ContentView: View {
    let timesTables = TimesTables(number: 12).allTables
    
    @State private var showingSheet = false
    @State private var numberOfQuestions = "0"
    @State private var questions = [String]()
    @State private var selectedTables = [[Int]]()
    @State private var tables: String = ""
    
    @State private var choosenTables = [Table]()
    
    @State private var isSelected = false
    
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
                                        self.addOrDeleteTable(of: table)
                                        print("tables are: \(self.choosenTables.sorted(by: < ))")
                                    }) {
                                         Text("\(table.id)")
                                    }
                                    .buttonStyle(ButtonStyleColored(table: table.id, isSelected: self.choosenTables.contains(table)))
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
                        Text("Learn")
                        .font(.system(size: 30, weight: .bold, design: .rounded))
                            .foregroundColor(.black)
                    })
                    Spacer()
                    Button(action: {
                        //add action
                    }, label: {
                        Text("Scores")
                            .modifier(PrimaryLabel())
                    })
                    
                    Spacer()
                    Button(action: {
                        self.showingSheet.toggle()
                        self.play()
                    }, label: {
                        Text("Play")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                        .foregroundColor(.black)
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
    
    func addOrDeleteTable(of table: Table) {
        if choosenTables.contains(table) {
            choosenTables.removeAll { table == $0 }
        } else {
            choosenTables.append(table)
        }
    }
    
    func play() {
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

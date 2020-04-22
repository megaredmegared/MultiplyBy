//
//  ContentView.swift
//  MultiplyBy
//
//  Created by megared on 15/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

struct ContentView: View {
    private let timesTables = TimesTable().all
    
    @State private var numberOfQuestions = ""
    @State private var choosenTables = TimesTable().all
    
    @State private var showingLearnSheet = false
    @State private var showingScoreSheet = false
    @State private var showingPlaySheet = false
    @State private var isPresented = false
    
    var body: some View {
        
        
        ZStack {
            GeometryReader { geo in
                VStack {
                    
                    Image("title")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    
                    
                    Spacer(minLength: 4)
                    // Buttons array
                    //                TablesSelectionView(timesTables: self.timesTables, choosenTables: self.$choosenTables)
                    VStack {
                        ForEach(self.timesTables.chunked(into: 3), id: \.self) { row in
                            HStack {
                                ForEach(row, id: \.self) { table in
                                    Button(action: {
                                        self.addOrDeleteTable(of: table)
                                        print("tables are: \(self.choosenTables.sorted(by: < ))")
                                    }) {
                                        Text("\(table.id)")
                                    }
                                    .buttonStyle(ButtonStyleColored(table: table.id, isSelected: self.choosenTables.contains(table)))
                                    .frame(maxWidth: geo.size.width / 4)
                                }
                            }.frame(maxHeight: geo.size.width / 4)
                        }
                        
                    }
                    
                    Spacer(minLength: 4)
                    // Bottom buttons
                    
                    HStack(spacing: 20) {
                        
                        Button(action: {
                            self.showingLearnSheet.toggle()
                        }) {
                            Text("Learn")
                        }.buttonStyle(ButtonStyleMain())
                        .sheet(isPresented: self.$showingLearnSheet) {
                            PageView(self.makeLearnViews())
                        }
                        
                        Button(action: {
                            self.showingScoreSheet.toggle()
                        }) {
                            Text("Scores")
                        }.buttonStyle(ButtonStyleMain())
                            .sheet(isPresented: self.$showingScoreSheet) {
                                GameView()
                        }
                        
                        Button(action: {
                            self.showingPlaySheet.toggle()
                        }) {
                            Text("Play")
                        }.buttonStyle(ButtonStyleMain())
                        .sheet(isPresented: self.$showingPlaySheet) {
                            GameView()
                        }
                    }
                    
                    Spacer(minLength: 0)
                    
                    
                }
            }.frame(maxWidth: 600)
            
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Image(systemName: "gear")
                }.padding(.horizontal)

                Spacer()
            }
 
        }.statusBar(hidden: true)
//        .modalLink(isPresented: $isPresented, linkType: ModalTransition.fullScreenModal) {
//            GameView()
//            VStack {
//                if self.showingScoreSheet {
//                    GameView()
//                } else if self.showingPlaySheet {
//                    GameView()
//                } else if self.showingLearnSheet {
//
//                }
//            }
//
//        }
        
        
        
    }
    
    func makeLearnViews() -> [LearnView] {
        var learnViews: [LearnView] = []
        for table in self.choosenTables.sorted() {
            learnViews.append(LearnView(table: table))
        }
        return learnViews
    }
    
    func addOrDeleteTable(of table: Table) {
        if choosenTables.contains(table) {
            choosenTables.removeAll { table == $0 }
        } else {
            choosenTables.append(table)
        }
    }
    
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ForEach(["iPhone 11", "iPhone SE (2nd generation)", "iPhone XS Max",  "iPad Pro (12.9-inch) (3rd generation)"], id: \.self) { deviceName in
//            ContentView()
//                .previewDevice(PreviewDevice(rawValue: deviceName))
//                .previewDisplayName(deviceName)
//        }
//    }
//}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

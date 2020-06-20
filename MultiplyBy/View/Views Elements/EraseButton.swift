//
//  File.swift
//  MultiplyBy
//
//  Created by megared on 10/06/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI
import CoreData

struct EraseButton: View {
    var moc: NSManagedObjectContext
    var scores: FetchedResults<Score>
    
    @State private var presentEraseMessage = false
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button(action: {
                    self.presentEraseMessage.toggle()
                }) {
                    Image(systemName: "trash")
                        .foregroundColor(.lightBlack)
                }
            }
            Spacer()
        }.padding()
            .edgesIgnoringSafeArea(.all)
            .alert(isPresented: $presentEraseMessage) {
                Alert(title: Text("Erase all?"), primaryButton: Alert.Button.cancel(), secondaryButton: .default(Text("Ok"), action: {
                    guard !self.scores.isEmpty else {
                        return
                    }
                    for number in 0..<self.scores.count {
                        self.moc.delete(self.scores[number])
                    }
                    try? self.moc.save()
                }))
        }
    }
}


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
    @Environment(\.managedObjectContext) var managedObjectContext
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
                Alert(title: Text(Translation.eraseAllScoresButtonLabel.rawValue), primaryButton: Alert.Button.cancel(), secondaryButton: .default(Text(Translation.okButtonLabel.rawValue), action: {
                    guard !self.scores.isEmpty else {
                        return
                    }
                    for number in 0..<self.scores.count {
                        self.managedObjectContext.delete(self.scores[number])
                    }
                    PersistenceController.shared.save()
                }))
        }
    }
}


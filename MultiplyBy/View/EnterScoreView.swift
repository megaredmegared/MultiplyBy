//
//  EnterScoreView.swift
//  MultiplyBy
//
//  Created by megared on 02/06/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//
import CoreData
import SwiftUI

struct EnterScoreView: View {
    @Environment(\.presentationMode) var presentationMode
    var moc: NSManagedObjectContext
    
    var timesTables: TimesTablesViewModel
    
    @State var name = ""
    @State var showNameMessage = false
    
    var body: some View {
        ZStack {
            Color.lightWhite
            
            VStack {
                Group {
                    Text("MessageScore")
                    
                    Text(" \(self.timesTables.score) ")
                        + Text("oneMinute")
                    TextField("EnterYourName", text: $name)
                        .multilineTextAlignment(.center)
                }
                .foregroundColor(.lightBlack)
                .roundedText(weight: .bold)
                
                if self.showNameMessage {
                  Text("nameIsEmpty")
                    .roundedText(weight: .bold)
                    .foregroundColor(.table1)
                }
                
                Spacer()
                
                Group {
                    Button(action: {
                        self.timesTables.score = 0
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("CancelButtonLabel")
                    }
                    .padding(.bottom)
                    
                    Button(action: {
                        guard !self.name.isEmpty else {
                            self.showNameMessage = true
                            return
                        }
                        
                        self.showNameMessage = false
                        
                        let score = Leaderboard(context: self.moc)
                        score.id = UUID()
                        score.name = self.name
                        score.score = Int64(self.timesTables.score)
                        
                        try? self.moc.save()
                        
                        self.timesTables.resetValue()
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("SaveButtonLabel")
                    }
                }
                .buttonStyle(MainButtonStyle(maxWidth: .infinity))
            }
            .padding()
            
        }
        .frame(maxWidth: 300, maxHeight: 300)
        .cornerRadius(10, antialiased: true)
        .modifier(SoftShadow())
        .padding()
    }
}

//struct EnterScoreView_Previews: PreviewProvider {
//    static var previews: some View {
//        EnterScoreView(timesTables: TimesTablesViewModel())
//    }
//}

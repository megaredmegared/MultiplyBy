//
//  NavigationButtons.swift
//  MultiplyBy
//
//  Created by megared on 28/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    /// custom corner
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct NavigationButtons: View {
    @EnvironmentObject var timesTables: TimesTables
    
    @State var isPresentedLearnSheet: Bool = false
    @State var isPresentedScoreSheet: Bool = false
    @State var isPresentedPlaySheet: Bool = false
    
    var body: some View {
        HStack(spacing: 10) {
            
            Button(action: {
                self.isPresentedLearnSheet.toggle()
            }) {
                Text("Learn")
            }.buttonStyle(ButtonStyleNavigation())
                .sheet(isPresented: self.$isPresentedLearnSheet) {
                    PageView(self.makeLearnViews())
            }
            
            Button(action: {
                self.isPresentedScoreSheet.toggle()
            }) {
                Text("Scores")
            }
            .buttonStyle(ButtonStyleNavigation())
            .sheet(isPresented: self.$isPresentedScoreSheet) {
                ScoresView()
            }

            Button(action: {
                withAnimation {
                    self.isPresentedPlaySheet.toggle()
                }
            }) {
                Text("Play")
            }
            .buttonStyle(ButtonStyleNavigation())
            .sheet(isPresented: self.$isPresentedPlaySheet) {
                GameView()
            }
        }
        
        .padding()
    }
    
    func makeLearnViews() -> [LearnView] {
        var learnViews: [LearnView] = []
        for table in self.timesTables.choosenTables.sorted() {
            learnViews.append(LearnView(table: table))
        }
        return learnViews
    }
}

struct NavigationButtons_Previews: PreviewProvider {
    static var previews: some View {
        NavigationButtons()
    }
}

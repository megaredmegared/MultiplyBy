//
//  ScoresView.swift
//  MultiplyBy
//
//  Created by megared on 28/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

struct ScoresView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.lightWhite.edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Scores View")
                
                
                Spacer()
                
                BackButton()
                .padding()
            }
            .frame(maxWidth: 600)
        }
        .deleteNavBar()
    }
}

struct ScoresView_Previews: PreviewProvider {
    static var previews: some View {
        ScoresView()
    }
}

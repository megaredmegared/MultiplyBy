//
//  SettingsButton.swift
//  MultiplyBy
//
//  Created by megared on 28/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI



struct SettingsButton: View {
    @State var isPresented = false
    @EnvironmentObject var timesTables: TimesTables
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Button(action: {
                    self.isPresented.toggle()
                }) {
                    Image(systemName: "gear")
                        .foregroundColor(Color.lightBlack)
                }
            }
            .padding(.horizontal)
            .sheet(isPresented: $isPresented) {
                SettingsView(timesTables: self.timesTables)
            }
            Spacer()
        }
    }
}

struct SettingsButton_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButton()
    }
}

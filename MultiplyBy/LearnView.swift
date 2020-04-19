//
//  LearnView.swift
//  MultiplyBy
//
//  Created by megared on 19/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

struct LearnView: View {
    private let colorScheme = ColorScheme()
    
    private var table: Table
    
    private var color: Color {
        colorScheme.returnColor(number: table.id)
    }
    
    private var shadowColor: Color {
        colorScheme.returnColor(number: table.id, shadowColor: true)
    }
    
    
    init(table: Table) {
        self.table = table
    }
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                RoundedRectangle(cornerRadius: 50, style: .continuous)
                    .foregroundColor(self.color)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50, style: .continuous)
                            .strokeBorder(self.color,lineWidth: geo.size.width * 0.03)
                            .colorMultiply(self.color.opacity(0.5)))
                    
                    
                    .padding(.horizontal, 20)
                    .offset(y: 120)
                
                Text("\(self.table.id)")
                    .foregroundColor(Color.white)
                    .font(.system(size: geo.size.width * 0.15, weight: .black, design: .rounded))
                    .shadow(color: self.shadowColor, radius: geo.size.width * 0.02)
                    .frame(maxWidth: geo.size.width / 3, maxHeight: geo.size.width  / 3)
                    .background(self.color)
                    .overlay(
                        Circle()
                            .strokeBorder(self.color,lineWidth: geo.size.width * 0.03)
                            .colorMultiply(self.color.opacity(0.5)))
                    .clipShape(Circle())
                    .offset(y: -280)
                ScrollView {
                    VStack(alignment: .trailing) {
                        ForEach(self.table.all.indices) { indice in
                            HStack() {
                                Text("\(self.table.id)")
                                .frame(width: geo.size.width / 8, alignment: .trailing)
                                Text("x")
                                .frame(width: geo.size.width / 8, alignment: .trailing)
                                Text("\(indice + 1)")
                                .frame(width: geo.size.width / 8, alignment: .trailing)
                                Text("=")
                                .frame(width: geo.size.width / 10, alignment: .trailing)
                                Text("\(self.table.all[indice])")
                                .frame(width: geo.size.width / 5, alignment: .trailing)
                            }
//                            .font(.system(size: geo.size.width * 0.09, weight: .black, design: .rounded).monospacedDigit())
                                .font(.system(size: geo.size.width * 0.09, weight: .black, design: .monospaced))
                                
                                
                               
                            
                            .offset(y: 190)
                            
                        }
                    }
                }
            }
        }
    }
}

struct LearnView_Previews: PreviewProvider {
    static var previews: some View {
        LearnView(table: Table(of: 24, index: 24))
    }
}

//
//  LearnView.swift
//  MultiplyBy
//
//  Created by megared on 19/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

extension Font {
    func monospacedDigitFont() -> Font {
        self.monospacedDigit()
    }
}

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
                
                ScrollView {
                    VStack(alignment: .trailing) {
                        Text("")
                            .frame(height: 65)
                        ForEach(self.table.all, id: \.self) { operation in
                            HStack() {
                                Text("\(operation.firstOperand)")
                                    .frame(width: geo.size.width / 8, alignment: .trailing)
                                Text("x")
                                    .frame(width: geo.size.width / 12, alignment: .trailing)
                                Text("\(operation.secondOperand)")
                                    .frame(width: geo.size.width / 8, alignment: .trailing)
                                Text("=")
                                    .frame(width: geo.size.width / 10, alignment: .trailing)
                                Text("\(operation.result)")
                                    .frame(width: geo.size.width / 5, alignment: .trailing)
                            }
                                //                            .font(.system(size: geo.size.width * 0.09, weight: .black, design: .rounded))
                                //                            .font(.system(size: geo.size.width * 0.09, weight: .black, design: .monospaced))
                                
                                .font(Font.monospacedDigitFont(.system(size: geo.size.width * 0.08, weight: .black, design: .rounded))())
                        }
                    }
                }.offset(y: 134)
                
                
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
                
            }
        }
    }
}

struct LearnView_Previews: PreviewProvider {
    static var previews: some View {
        LearnView(table: Table(of: 12, multiplier: 24))
    }
}

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

struct LearnView: View, Identifiable {
    
    var id: Int {
        table.id
    }
    
    private let colorScheme = ColorScheme()
    
    private var table: TableViewModel
    
    private var color: Color {
        colorScheme.returnColor(number: table.id)
    }
    
    init(table: TableViewModel) {
        self.table = table
    }
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                Rectangle()
                    .foregroundColor(self.color)
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    // table title number in a round
                    Text("\(self.table.id)")
                    .foregroundColor(Color.white)
                    .font(.system(size: geo.size.width * 0.10, weight: .black, design: .rounded))
                        .shadow(color: Color.black, radius: geo.size.width * 0.02)
                    .frame(maxWidth: geo.size.width / 3, maxHeight: geo.size.width  / 3)
                    .background(self.color)
                    .overlay(
                        Circle()
                            .strokeBorder(self.color,lineWidth: geo.size.width * 0.03)
                            .colorMultiply(self.color.opacity(0.5)))
                    .clipShape(Circle())
                        .padding()
                    
                    Spacer()
                    
                    // table
                    ForEach(self.table.multiplications, id: \.self) { operation in
                        HStack() {
                            Text("\(operation.firstOperand)")
                                .frame(width: geo.size.width / 8, alignment: .leading)
                            Text("x")
                                .frame(width: geo.size.width / 12, alignment: .center)
                            Text("\(operation.secondOperand)")
                                .frame(width: geo.size.width / 8, alignment: .trailing)
                            Text("=")
                                .frame(width: geo.size.width / 10, alignment: .trailing)
                            Text("\(operation.result)")
                                .frame(width: geo.size.width / 5, alignment: .trailing)
                        }
                        .font(Font.monospacedDigitFont(.system(size: geo.size.width * 0.08, weight: .black, design: .rounded))())
                    }
                    Spacer()
                }

            }
        }
    }
}

struct LearnView_Previews: PreviewProvider {
    static var previews: some View {
        LearnView(table: TableViewModel(of: 2, numberOfTables: 12))
    }
}

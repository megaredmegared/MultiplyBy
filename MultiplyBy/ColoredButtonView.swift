//
//  ColoredButtonView.swift
//  MultiplyBy
//
//  Created by megared on 15/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI
struct ColorScheme {
    //        var color: UIColor
    //        var shadowColor: UIColor
    var all = [[Color(#colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)), Color(#colorLiteral(red: 0.5807225108, green: 0.066734083, blue: 0, alpha: 1))],
               [Color(#colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)), Color(#colorLiteral(red: 0.5787474513, green: 0.3215198815, blue: 0, alpha: 1))],
               [Color(#colorLiteral(red: 0.9995340705, green: 0.988355577, blue: 0.4726552367, alpha: 1)), Color(#colorLiteral(red: 0.5738074183, green: 0.5655357838, blue: 0, alpha: 1))],
               [Color(#colorLiteral(red: 0.8321695924, green: 0.985483706, blue: 0.4733308554, alpha: 1)), Color(#colorLiteral(red: 0.3084011078, green: 0.5618229508, blue: 0, alpha: 1))],
               [Color(#colorLiteral(red: 0.4500938654, green: 0.9813225865, blue: 0.4743030667, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.5603182912, blue: 0, alpha: 1))],
               [Color(#colorLiteral(red: 0.4508578777, green: 0.9882974029, blue: 0.8376303315, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1))],
               [Color(#colorLiteral(red: 0.4513868093, green: 0.9930960536, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1))],
               [Color(#colorLiteral(red: 0.4620226622, green: 0.8382837176, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1))],
               [Color(#colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1))],
               [Color(#colorLiteral(red: 0.8446564078, green: 0.5145705342, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.3236978054, green: 0.1063579395, blue: 0.574860394, alpha: 1))],
               [Color(#colorLiteral(red: 1, green: 0.5212053061, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.5810584426, green: 0.1285524964, blue: 0.5745313764, alpha: 1))],
               [Color(#colorLiteral(red: 1, green: 0.5409764051, blue: 0.8473142982, alpha: 1)), Color(#colorLiteral(red: 0.5808190107, green: 0.0884276256, blue: 0.3186392188, alpha: 1))]]
    
    }

struct ColoredButtonView: View {

    let colorScheme = ColorScheme().all
    
    var text: String
    var color: Color
    var shadowColor: Color
    var size: CGFloat = 120
    var selectedTable: Int
    
    init(table: Int) {
        self.text = String(table)
        self.selectedTable = table
        self.color = colorScheme[table - 1][0]
        self.shadowColor = colorScheme[table - 1][1]
    }
    
    func action() {
        print("test button pressed is \(selectedTable)")
    }
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .foregroundColor(Color.white)
                .fontWeight(.black)
                .font(.largeTitle)
                .shadow(color: shadowColor, radius: 5)
                .frame(width: size, height: size, alignment: .center)
                .background(color)
                .overlay(
                    Circle()
                        .strokeBorder(color,lineWidth: 10)
                        .colorMultiply(color.opacity(0.5))
                    
            )
                .clipShape(Circle())
        }
    }
    
}

struct ColoredButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ColoredButtonView(table: 1)
    }
}

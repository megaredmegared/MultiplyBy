//
//  NumPad.swift
//  MultiplyBy
//
//  Created by megared on 12/05/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

struct NumPad: View {
    @State var result: String = ""
    
    var body: some View {
        HStack(spacing: 10) {
            VStack(spacing: 10) {
                HStack(spacing: 10) {
                    GameButton(result: $result, number: "7")
                    GameButton(result: $result, number: "8")
                    GameButton(result: $result, number: "9")
                }
                HStack(spacing: 10) {
                    GameButton(result: $result, number: "4")
                    GameButton(result: $result, number: "5")
                    GameButton(result: $result, number: "6")
                }
                HStack(spacing: 10) {
                    GameButton(result: $result, number: "1")
                    GameButton(result: $result, number: "2")
                    GameButton(result: $result, number: "3")
                }
                GameButton(result: $result, number: "0")
            }
            VStack(spacing: 10) {
                GameButton(result: $result, number: "<")
                GameButton(result: $result, number: "OK").frame(height: 150)
            }
        }
        .frame(width: 200, height: 200)
    }
}


struct NumPad_Previews: PreviewProvider {
    static var previews: some View {
        NumPad()
    }
}

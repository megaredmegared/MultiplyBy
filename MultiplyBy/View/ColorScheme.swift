//
//  ColorScheme.swift
//  MultiplyBy
//
//  Created by megared on 17/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

/// Color scheme for the app MultiplyBy
struct ColorScheme {
    /// All the possibles colors stored in an array
    var all = [
        Color.pink,
        Color.red,
        Color.orange,
        Color.yellow,
        Color(.systemTeal),
        Color.blue,
        Color(.systemIndigo),
        Color.purple,
        Color.green
    ]
    
    /// Return the color for a given number

    func returnColor(number: Int) -> Color {
           if number / all.count == 0 {
               return all[number]
           }
           return all[number % all.count]
       }
}

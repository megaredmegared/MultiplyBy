//
//  ColorScheme.swift
//  MultiplyBy
//
//  Created by megared on 17/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

extension Color {
    static let whiteShadow = Color(UIColor.init(named: "WhiteShadow")!)
    static let blackShadow = Color(UIColor.init(named: "BlackShadow")!)
    static let fullWhite = Color(UIColor.init(named: "FullWhite")!)
    static let lightWhite = Color(UIColor.init(named: "LightWhite")!)
    static let lightBlack = Color(UIColor.init(named: "LightBlack")!)
    static let table1 = Color(UIColor.init(named: "Table1")!)
    static let table1DarkShadow = Color(UIColor.init(named: "Table1DarkShadow")!)
    static let table1LightShadow = Color(UIColor.init(named: "Table1LightShadow")!)
    static let table2 = Color(UIColor.init(named: "Table2")!)
    static let table3 = Color(UIColor.init(named: "Table3")!)
    static let table4 = Color(UIColor.init(named: "Table4")!)
    static let table5 = Color(UIColor.init(named: "Table5")!)
    static let table5LightShadow = Color(UIColor.init(named: "Table5LightShadow")!)
    static let table5DarkShadow = Color(UIColor.init(named: "Table5DarkShadow")!)
    static let table6 = Color(UIColor.init(named: "Table6")!)
    static let table7 = Color(UIColor.init(named: "Table7")!)
    static let table7LightShadow = Color(UIColor.init(named: "Table7LightShadow")!)
    static let table7DarkShadow = Color(UIColor.init(named: "Table7DarkShadow")!)
    static let table8 = Color(UIColor.init(named: "Table8")!)
    static let table9 = Color(UIColor.init(named: "Table9")!)
    static let table10 = Color(UIColor.init(named: "Table10")!)
    static let table11 = Color(UIColor.init(named: "Table11")!)
    static let table12 = Color(UIColor.init(named: "Table12")!)
}

/// Color scheme for the app MultiplyBy
struct AppColorScheme {
    /// All the possibles colors stored in an array
    var all = [
        Color.table1,
        Color.table2,
        Color.table3,
        Color.table4,
        Color.table5,
        Color.table6,
        Color.table7,
        Color.table8,
        Color.table9,
        Color.table10,
        Color.table11,
        Color.table12
    ]

    /// Return the color for a given number 
    func returnColor(tableNumber: Int) -> Color {
           return all[tableNumber - 1 % all.count]
       }
}

//
//  Extensions.swift
//  MultiplyBy
//
//  Created by megared on 28/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import Foundation

extension Array {
    /// chunk array into array of multiple arrays
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}

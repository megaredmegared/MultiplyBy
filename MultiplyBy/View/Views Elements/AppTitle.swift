//
//  AppTitle.swift
//  MultiplyBy
//
//  Created by megared on 28/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

/// Styled title of the app
struct AppTitle: View {
    private let title = "Multiply By".map { String($0) }
    
    var body: some View {
        Image("title")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct AppTitle_Previews: PreviewProvider {
    static var previews: some View {
        AppTitle()
    }
}

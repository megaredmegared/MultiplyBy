//
//  PageView.swift
//  MultiplyBy
//
//  Created by megared on 20/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI


struct PageView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    @State var currentPage = 0

    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }

    var body: some View {

            ZStack {
                Rectangle()
                .edgesIgnoringSafeArea(.all)
                
                PageViewController(controllers: viewControllers, currentPage: $currentPage)
                
//                PageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
//                    .padding(.trailing)
                
            
        }
    }
}

struct PageView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        PageView([LearnView(table: TableViewModel(of: 1, numberOfTables: 12)),
                  LearnView(table: TableViewModel(of: 2, numberOfTables: 12)),
                  LearnView(table: TableViewModel(of: 3, numberOfTables: 12)),
                  LearnView(table: TableViewModel(of: 4, numberOfTables: 12))])
    }
}

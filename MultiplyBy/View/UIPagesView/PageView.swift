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
            
            PageViewController(controllers: viewControllers, currentPage: $currentPage).edgesIgnoringSafeArea(.all)
            
            //Pages dots indicators
            VStack {
                Spacer()
                PageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
                    .padding(.trailing)
            }
        }
    }
}

struct PageView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        PageView([LearnView(table: TableViewModel(of: 1)),
                  LearnView(table: TableViewModel(of: 2)),
                  LearnView(table: TableViewModel(of: 3)),
                  LearnView(table: TableViewModel(of: 4))])
    }
}

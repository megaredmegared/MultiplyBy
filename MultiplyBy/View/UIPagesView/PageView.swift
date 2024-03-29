//
//  PageView.swift
//  MultiplyBy
//
//  Created by megared on 20/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

/// Pagesview to use with swiftUI
struct PageView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    @State var currentPage = 0
    @Binding var isPresented: Bool

    init(_ views: [Page], isPresented: Binding<Bool>) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
        self._isPresented = isPresented
    }

    var body: some View {

        ZStack {

            PageViewController(controllers: viewControllers, currentPage: $currentPage).edgesIgnoringSafeArea(.all)

            // Pages dots indicators
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

        PageView([LearnView(table: TableViewModel(of: 1), showPageView: .constant(true)),
                  LearnView(table: TableViewModel(of: 2), showPageView: .constant(true)),
                  LearnView(table: TableViewModel(of: 3), showPageView: .constant(true)),
                  LearnView(table: TableViewModel(of: 4), showPageView: .constant(true))],
                 isPresented: .constant(true))
    }
}

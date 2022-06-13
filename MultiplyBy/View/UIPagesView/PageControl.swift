//
//  PageControl.swift
//  MultiplyBy
//
//  Created by megared on 20/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int

    func makeCoordinator() -> Coordinator {
         Coordinator(self)
     }

    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)
        control.pageIndicatorTintColor = UIColor.init(named: "LightWhite")?.withAlphaComponent(0.2)
        control.currentPageIndicatorTintColor = UIColor.init(named: "LightWhite")

        return control
    }

    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }

    class Coordinator: NSObject {
           var control: PageControl

           init(_ control: PageControl) {
               self.control = control
           }

           @objc func updateCurrentPage(sender: UIPageControl) {
               control.currentPage = sender.currentPage
           }
       }
}

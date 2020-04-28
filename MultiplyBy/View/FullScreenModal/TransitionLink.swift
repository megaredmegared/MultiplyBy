//
//  SwiftUIView.swift
//  MultiplyBy
//
//  Created by megared on 22/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

import SwiftUI

enum ModalTransition: TransitionLinkType {
    case fullScreenModal
    case scale

    var transition: AnyTransition {
        switch self {
        case .fullScreenModal:
            return .move(edge: .bottom)
        case .scale:
            return .scale(scale: 0)
        }
    }
}

protocol TransitionLinkType {
    var transition: AnyTransition { get }
}



struct ModaViewModifier<Destination>: ViewModifier where Destination: View {

    @Binding var isPresented: Bool
    var linkType: TransitionLinkType
    var destination: () -> Destination

    func body(content: Self.Content) -> some View {
        TransitionLink(isPresented: self.$isPresented,
                       linkType: linkType,
                       destination: {
                        self.destination()
        }, content: {
            content
        })
    }

}



struct TransitionLink<Content, Destination>: View where Content: View, Destination: View {

    @Binding var isPresented: Bool
    var content: () -> Content
    var destination: () -> Destination
    var linkType: TransitionLinkType
        
    init(isPresented: Binding<Bool>, linkType: TransitionLinkType, @ViewBuilder destination: @escaping () -> Destination, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.destination = destination
        self._isPresented = isPresented
        self.linkType = linkType
    }
    
    var body: some View {
        ZStack {
            if self.isPresented {
                self.destination()
                    .transition(self.linkType.transition)
            } else {
                self.content()
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

struct ModaLinkViewModifier<Destination>: ViewModifier where Destination: View {

    @Binding var isPresented: Bool
    var linkType: TransitionLinkType
    var destination: () -> Destination

    func body(content: Self.Content) -> some View {
        TransitionLink(isPresented: self.$isPresented,
                       linkType: linkType,
                       destination: {
                        self.destination()
        }, content: {
            content
        })
    }

}

extension View {

    func modalLink<Destination: View>(isPresented: Binding<Bool>,
                                      linkType: TransitionLinkType,
                                      destination: @escaping () -> Destination) -> some View {
        self.modifier(ModaLinkViewModifier(isPresented: isPresented,
                                           linkType: linkType,
                                           destination: destination))
    }

}

//
//struct SwiftUIView_Previews: PreviewProvider {
//    static var previews: some View {
//        SwiftUIView()
//    }
//}

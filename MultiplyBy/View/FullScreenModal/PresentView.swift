//
//  PresentView.swift
//  MultiplyBy
//
//  Created by megared on 28/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

extension View {
//    public func presentView<Content>(isPresented: Binding<Bool>, onDismiss: (() -> Void)? = nil, @ViewBuilder content: @escaping () -> Content) -> some View where Content : View {
//        self.modifier(PresentView(isPresented: isPresented, content: content))
//    }
    
    public func presentView<Content>(isPresented: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) -> some View where Content : View {
        self.modifier(PresentView(isPresented: isPresented, content: content))
    }
}

struct PresentView<Content>: ViewModifier where Content: View {
    
    @Binding var isPresented: Bool
    var content: () -> Content
    
    @GestureState private var dragOffset = CGSize.zero
    @State private var position = CGSize.zero
    
    init(isPresented: Binding<Bool>, @ViewBuilder content: @escaping () -> Content) {
        self._isPresented = isPresented
        self.content = content
    }
    
    func body(content: Self.Content) -> some View {
        ZStack {
            if self.isPresented {
                self.content()
//                    .offset(y: dragOffset.height)
//                    .gesture(
//                        DragGesture(minimumDistance: 50)
//                            .updating($dragOffset, body: { (value, state, transaction) in
//                                
//                                state = value.translation
//                            })
//                            .onEnded { value in
//                                self.position.height += value.translation.height
//                                self.isPresented = false
//                        }
//                )
            }
        }
    }
}

//struct PresentView_Previews: PreviewProvider {
//    static var previews: some View {
//        PresentView()
//    }
//}

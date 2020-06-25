//
//  GameTimer.swift
//  MultiplyBy
//
//  Created by megared on 09/06/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

struct GameTimer: View {
    
    var size: CGFloat
    @Binding var isOver: Bool
    @State var timeRemaining = 60 // seconds
    @State var isActive = true
    @State var timer = Timer.publish (every: 1, on: .main, in: .common).autoconnect()
    
    func instantiateTimer() {
        self.timer = Timer.publish (every: 1, on: .main, in: .common).autoconnect()
        return
    }
    
    func cancelTimer() {
        self.timer.upstream.connect().cancel()
        return
    }
    
    var body: some View {
        Text("\(self.timeRemaining)")
            .roundedText(size: self.size, weight: .bold)
            .foregroundColor(.lightBlack)
            .onAppear {
                self.instantiateTimer()
        }
        .onDisappear() {
            self.cancelTimer()
        }
        .onReceive(self.timer) { _ in
            guard self.isActive else { return }
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            }
            else if self.timeRemaining == 0 {
                self.cancelTimer()
                self.isActive = false
                withAnimation {
                    self.isOver.toggle()
                }   
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            self.isActive = false
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
            self.isActive = true
        }
    }
}


struct GameTimer_Previews: PreviewProvider {
    static var previews: some View {
        GameTimer(size: 100, isOver: .constant(false))
    }
}

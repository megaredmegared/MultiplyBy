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
        timer = Timer.publish (every: 1, on: .main, in: .common).autoconnect()
        return
    }
    
    func cancelTimer() {
        timer.upstream.connect().cancel()
        return
    }
    
    var body: some View {
        Text("\(timeRemaining)")
            .roundedText(size: size, weight: .bold)
            .foregroundColor(.lightBlack)
            .onAppear {
                instantiateTimer()
        }
        .onDisappear() {
            cancelTimer()
        }
        .onReceive(timer) { _ in
            guard isActive else { return }
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
            else if timeRemaining == 0 {
                cancelTimer()
                isActive = false
                withAnimation {
                    isOver.toggle()
                }   
            }
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            isActive = false
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
            isActive = true
        }
    }
}


struct GameTimer_Previews: PreviewProvider {
    static var previews: some View {
        GameTimer(size: 100, isOver: .constant(false))
    }
}

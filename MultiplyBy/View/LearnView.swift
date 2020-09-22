//
//  LearnView.swift
//  MultiplyBy
//
//  Created by megared on 19/04/2020.
//  Copyright © 2020 OpenClassrooms. All rights reserved.
//

import SwiftUI

struct LearnView: View, Identifiable {
    @Environment(\.presentationMode) var presentationMode
    @Binding var showPageView: Bool
    
    var id: Int {
        table.id
    }
    
    private let colorScheme = AppColorScheme()
    
    private var table: TableViewModel
    
    private var color: Color {
        colorScheme.returnColor(tableNumber: table.id)
    }
    
    init(table: TableViewModel, showPageView: Binding<Bool>) {
        self.table = table
        self._showPageView = showPageView
    }
    
    var body: some View {
        ZStack {
            self.color.edgesIgnoringSafeArea(.all)
            
                VStack {
                    Spacer()
                    
                    Text("\(self.table.id)")
                        .foregroundColor(.lightWhite)
                        .roundedText(size: UIScreen.screenWidth * 0.20, weight: .black)
                        .frame(width: UIScreen.screenWidth * 0.3, height: UIScreen.screenWidth * 0.3)
                        .overlay(Circle().stroke(Color.lightWhite, lineWidth: UIScreen.screenWidth * 0.02))
                    
                    Spacer()
                    
                    ForEach(self.table.multiplications, id: \.self) { operation in
                        HStack() {
                            Text("\(operation.firstOperand)")
                                .frame(width: UIScreen.screenWidth / 8, alignment: .leading)
                            Text("x")
                                .frame(width: UIScreen.screenWidth / 12, alignment: .center)
                            Text("\(operation.secondOperand)")
                                .frame(width: UIScreen.screenWidth / 8, alignment: .trailing)
                            Text("=")
                                .frame(width: UIScreen.screenWidth / 10, alignment: .trailing)
                            Text("\(operation.result)")
                                .frame(width: UIScreen.screenWidth / 5, alignment: .trailing)
                        }
                        .font(Font.monospacedDigitFont(.system(size: UIScreen.screenWidth * 0.08, weight: .black, design: .rounded))())
                        .foregroundColor(.lightWhite)
                    }
                    Spacer(minLength: 40)
                }
            
            //MARK: - Back Button
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                        self.showPageView = false
                    }) {
                        Image(systemName: "xmark.circle")
                            .roundedText()
                            .foregroundColor(Color.lightWhite)
                            .padding()
                    }
                }
                Spacer()
            }
        }
    }
}

struct LearnView_Previews: PreviewProvider {
    static var previews: some View {
        LearnView(table: TableViewModel(of: 3), showPageView: .constant(false))
    }
}

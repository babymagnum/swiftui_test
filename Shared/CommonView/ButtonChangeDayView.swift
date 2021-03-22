//
//  ButtonChangeDayView.swift
//  SwiftUITest (iOS)
//
//  Created by фкшуа on 22/03/21.
//

import SwiftUI

struct ButtonChangeDayTime: View {
    
    var textColor: Color
    var backgroundColor: Color
    var title: String
    var action: ((_ text: String) -> Void)
    
    var body: some View {
        Button {
            action(title)
        } label: {
            Text(title)
                .font(.system(size: 20, weight: .medium))
                .frame(width: UIScreen.screenWidth - 48, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(backgroundColor)
                .foregroundColor(textColor)
                .padding([.bottom, .top], 15)
        }.background(Color.init(.white)).cornerRadius(10).padding(.bottom, 20)
    }
}

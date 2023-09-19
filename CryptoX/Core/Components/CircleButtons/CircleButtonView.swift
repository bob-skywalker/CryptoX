//
//  CircleButtonView.swift
//  CryptoX
//
//  Created by Bo Zhong on 9/19/23.
//

import SwiftUI

struct CircleButtonView: View {
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.myAccentColor)
            .frame(width:50, height: 50)
            .background(
                Circle()
                    .foregroundColor(Color.backgroundColor)
            )
            .shadow(color: Color.myAccentColor.opacity(0.30), radius: 10, x: 0.0, y: 0.0)
            .padding()
    }
}

struct CircleButtonView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircleButtonView(iconName: "heart.fill")
                .previewLayout(.sizeThatFits)
            
            CircleButtonView(iconName: "heart.fill")
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}

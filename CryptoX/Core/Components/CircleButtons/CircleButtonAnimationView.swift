//
//  CircleButtonAnimationView.swift
//  CryptoX
//
//  Created by Bo Zhong on 9/19/23.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    @Binding var animate: Bool
    
    var body: some View {
        Circle()
            .stroke(lineWidth: 4.8)
            .scale(animate ? 1.0 : 0.0)
            .opacity(animate ? 0.0 : 1.0)
            .animation(animate ? .easeOut(duration: 0.58) : .none , value: animate)
            .foregroundColor(Color.myAccentColor)
    }
}

struct CircleButtonAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimationView(animate: .constant(true))
            .foregroundColor(.red)
            .frame(width: 100, height: 100)
    }
}

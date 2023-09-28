//
//  UIApplication.swift
//  CryptoX
//
//  Created by Bo Zhong on 9/27/23.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing(){
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

//
//  Double.swift
//  CryptoX
//
//  Created by bo zhong on 9/19/23.
//

import Foundation

extension Double {
    
    /// Converts a Double -> Currency with 2-6 decimal places
    /// ```
    /// Convert 1234.56 to $ 1,234.56
    /// Convert 1.23456 to $ 1.23
    /// ```
    private var currentFormatter2: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        return formatter
    }
    
    /// Converts a Double -> Currency as a String with 2-6 decimal places
    /// ```
    /// Convert 1234.56 to $ "1,234.56"
    /// Convert 1.23456 to $ "1.23456"
    /// ```
    func asCurrencyWith2Decimals() -> String {
        let number = NSNumber(value: self)
        return currentFormatter2.string(from: number) ?? "$0.00"
    }
    
    
    /// Converts a Double -> Currency with 2-6 decimal places
    /// ```
    /// Convert 1234.56 to $ 1,234.56
    /// Convert 1.23456 to $ 1.23456
    /// ```
    private var currentFormatter6: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 6
        
        return formatter
    }
    
    /// Converts a Double -> Currency as a String with 2-6 decimal places
    /// ```
    /// Convert 1234.56 to $ "1,234.56"
    /// Convert 1.23456 to $ "1.23456"
    /// ```
    func asCurrencyWith6Decimals() -> String {
        let number = NSNumber(value: self)
        return currentFormatter6.string(from: number) ?? "$0.00"
    }
    
    
    
    /// Converts a Double into string representation
    /// ```
    /// Convert 1234.56 to $ "1234.56"
    /// Convert 1.23456 to $ "1.23"
    /// ```
    func asNumberString() -> String {
        return String(format: "%.2f", self)
    }
    
    
    /// Converts a Double into string representation with percent symbol
    /// ```
    /// Convert "1234.56" to $ "1234.56%"
    /// ```
    func asPercentString() -> String {
        return asNumberString() + "%"
    }
}

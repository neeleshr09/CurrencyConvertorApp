//
//  Utilities.swift
//  CurrencyConvertorApp
//
//  Created by Neelesh Rai on 21/08/22.
//

import SwiftUI
import Foundation

extension String {
    static let numberFormatter = NumberFormatter()
    
    var doubleValue: Double {
        String.numberFormatter.decimalSeparator = "."
        if let result = String.numberFormatter.number(from: self) {
            return result.doubleValue
        } else {
            String.numberFormatter.decimalSeparator = ","
            if let result = String.numberFormatter.number(from: self) {
                return result.doubleValue
            }
        }
        return 0
    }
}

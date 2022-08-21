//
//  CurrencyModel.swift
//  CurrencyConvertorApp
//
//  Created by Neelesh Rai on 21/08/22.
//

import SwiftUI

//To display data
struct CurrencyModel: Identifiable {
    
    var id = UUID().uuidString
    var currencyName: String
    var currencyValue: Double
}

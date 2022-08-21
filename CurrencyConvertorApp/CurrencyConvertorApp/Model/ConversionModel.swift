//
//  ConversionModel.swift
//  CurrencyConvertorApp
//
//  Created by Neelesh Rai on 21/08/22.
//

import SwiftUI

struct ConversionModel: Decodable {
    
    var disclaimer: String
    var license: String
    var timestamp: Int
    var base: String
    var rates: [String: Double]
}


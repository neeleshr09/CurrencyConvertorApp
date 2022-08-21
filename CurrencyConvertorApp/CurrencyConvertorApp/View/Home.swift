//
//  Home.swift
//  CurrencyConvertorApp
//
//  Created by Neelesh Rai on 21/08/22.
//

import SwiftUI

struct Home: View {
    
    @StateObject var viewModel = FetchData()
    @State private var enteredAmount: String = "1.0"
    
    var body: some View {
        
        VStack {
            if viewModel.conversionData.isEmpty {
                ProgressView()
            } else {
                Form {
                    Section(header: Text("Convert a currency")) {
                        TextField("Enter an amount", text: $enteredAmount)
                            .keyboardType(.decimalPad)
    
                        Menu(content: {
                            ForEach(viewModel.conversionData) { rate in
                                Button(action: {viewModel.updateData(base: rate.currencyName)}, label: {
                                    Text(rate.currencyName)
                                })
                            }
                        }) {
                            Text("Base = \(viewModel.base)")
                                .fontWeight(.heavy)
                        }
                        .padding(.trailing, 4.0)
                    }
                }
                
                Section(header: Text("Conversion")) {
                    ScrollView {
                        LazyVStack(alignment: .leading, spacing: 15,  content: {
                            ForEach(viewModel.conversionData) { rate in
                                HStack(spacing: 15) {
                                    Text(rate.currencyName)
                                        .font(.title)
                                        .fontWeight(.bold)
                                    Text("\(convert(rate))")
                                        .fontWeight(.heavy)
                                }
                            }
                            .padding(.horizontal)
                        })
                    }
                    .padding(.top)
                }
            }
        }
    }
    
    func convert(_ convertValue: CurrencyModel) -> String {
        var conversion: Double = 1.0
        let amount = Double(enteredAmount.doubleValue)
        conversion = amount * (convertValue.currencyValue)
        
        return String(format: "%.2f", conversion)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

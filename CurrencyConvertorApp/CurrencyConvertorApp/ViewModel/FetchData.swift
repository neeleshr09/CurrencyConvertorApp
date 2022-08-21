//
//  FetchData.swift
//  CurrencyConvertorApp
//
//  Created by Neelesh Rai on 21/08/22.
//

import SwiftUI

class FetchData: ObservableObject {
    @Published var conversionData: [CurrencyModel] = []
    @Published var base = "USD"
    
    init() {
        fetch()
    }
    
    private func fetch() {
        if let url = URL(string: "http://openexchangerates.org/api/latest.json?app_id=1ffdbee46f0b44ef99c918336824af26") {
            let session = URLSession(configuration: .default)
            
            session.dataTask(with: url) { (data, resp, error) in
                if let jsonData = data {
                    do {
                        let conversion = try JSONDecoder().decode(ConversionModel.self, from: jsonData)
                        print(conversion)
                        
                        DispatchQueue.main.async {
                            self.conversionData = conversion.rates.compactMap({ (key, value) -> CurrencyModel? in
                                return CurrencyModel(currencyName: key, currencyValue: value)
                            })
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                } else {
                    self.loadLocalData(withFileName: "rates")
                }
            }
            .resume()
        }
    }
    
    func loadLocalData(withFileName name: String) {
        if let path = Bundle.main.path(forResource: name, ofType: "json") {
            do {
                let localData = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let conversion = try JSONDecoder().decode(ConversionModel.self, from: localData)
                print(conversion)
                
                DispatchQueue.main.async {
                    self.conversionData = conversion.rates.compactMap({ (key, value) -> CurrencyModel? in
                        return CurrencyModel(currencyName: key, currencyValue: value)
                    })
                }
            } catch {
                
            }
        }
    }
    
    func updateData(base: String) {
        self.base = base
        self.conversionData.removeAll()
        self.fetch()
    }
}

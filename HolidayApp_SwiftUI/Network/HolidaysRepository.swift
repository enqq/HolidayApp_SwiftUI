//
//  HolidaysRepository.swift
//  HolidayApp_SwiftUI
//
//  Created by Dawid Karpiński on 12/09/2022.
//

import Foundation
import Combine

struct HolidaysRepository {
    var network: Network
    
    init(_ network: Network = Network()) {
        self.network = network
    }
    
    private let baseUrl = URL.init(string: "https://holidayapi.com/v1")
    private let apiKey = ""
    
    private enum Endpoint: String {
        case listCountries =  "countries"
        case listHolidays = "holidays"
    }
    
    /// Fetch country list from holidayapi service
    func fetchCountries() -> AnyPublisher<Countries, Error> {
        let url = baseUrl?.appendingPathComponent(Endpoint.listCountries.rawValue)
        
        return network.GET(url!, params: ["key": apiKey])
            .eraseToAnyPublisher()
    }
    
    ///  Get a list of holidays via country code
    func fetchHolidays(code countryCode: String) -> AnyPublisher<Holidays, Error> {
        let url = baseUrl?.appendingPathComponent(Endpoint.listHolidays.rawValue)
        let year = Calendar.current.component(.year, from: Date()) - 1
                
        return network.GET(url!, params: ["key": apiKey,
                                         "country": countryCode,
                                          "year": String(year)])
                .eraseToAnyPublisher()
    }
}

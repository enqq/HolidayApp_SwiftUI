//
//  CountriesState.swift
//  HolidayApp_SwiftUI
//
//  Created by Dawid Karpiński on 12/09/2022.
//

import Foundation

struct CountriesState: Codable {
    let didSelectCountry: Country
    let countries: [Country]
    let isLoading: Bool
}

extension CountriesState {
    init() {
        didSelectCountry = .init()
        countries = []
        isLoading = false
    }
}

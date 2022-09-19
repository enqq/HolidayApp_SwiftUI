//
//  HolidaysActions.swift
//  HolidayApp_SwiftUI
//
//  Created by Dawid Karpiński on 12/09/2022.
//

import Foundation

enum CountriesActions: Action {
    case fetchCountries
    case didReceiveCountries(Countries)
    case didSelectCountry(Country)
    case selectedCountry
    case clear
}

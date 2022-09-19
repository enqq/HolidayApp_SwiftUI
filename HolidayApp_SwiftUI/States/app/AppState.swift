//
//  AppState.swift
//  HolidayApp_SwiftUI
//
//  Created by Dawid Karpiński on 12/09/2022.
//

import Foundation

struct AppState: Codable {
    let countries: CountriesState
    let holidays: HolidaysState
}

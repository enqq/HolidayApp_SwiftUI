//
//  AppReducer.swift
//  HolidayApp_SwiftUI
//
//  Created by Dawid Karpiński on 12/09/2022.
//

import Foundation

extension AppState {
    static let reducer: Reducer<Self> = { state, action in
        AppState(countries: CountriesState.reducer(state.countries, action),
                 holidays: HolidaysState.reducer(state.holidays, action))
    }
}

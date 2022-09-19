//
//  CountriesReducer.swift
//  HolidayApp_SwiftUI
//
//  Created by Dawid Karpiński on 12/09/2022.
//

import Foundation

extension CountriesState {
    static let reducer: Reducer<CountriesState> = { state, action in
        switch action {
        case CountriesActions.fetchCountries:
            return CountriesState.init(didSelectCountry: .init(),
                                      countries: [],
                                      isLoading: true )
            
        case CountriesActions.didSelectCountry(let country):
            return CountriesState.init(didSelectCountry: country,
                                      countries: [],
                                      isLoading: false)
        
        case CountriesActions.selectedCountry:
            return CountriesState.init(didSelectCountry: state.didSelectCountry,
                                      countries: [],
                                      isLoading: false)
            
        case CountriesActions.didReceiveCountries(let countries):
            return CountriesState.init(didSelectCountry: .init(),
                                      countries: countries.country,
                                      isLoading: false)
            
        case CountriesActions.clear:
            return CountriesState.init()
            
        default:
            return state
        }
    }
}

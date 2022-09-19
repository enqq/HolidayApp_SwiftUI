//
//  HolidaysMiddlewares.swift
//  HolidayApp_SwiftUI
//
//  Created by Dawid Karpiński on 13/09/2022.
//

import Foundation
import Combine

extension Middlewares {
    private static let holidaysRepository = HolidaysRepository()
    
    static let countries: Middleware<AppState> = { state, action in
        switch action {
        case CountriesActions.fetchCountries:
            return holidaysRepository
                .fetchCountries()
                .replaceError(with: Countries())
                .map{ CountriesActions.didReceiveCountries($0) }
                .eraseToAnyPublisher()
        default:
            return Empty()
                .eraseToAnyPublisher()
        }
    }
}

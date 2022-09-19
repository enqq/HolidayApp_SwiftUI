//
//  HolidaysMiddleware.swift
//  HolidayApp_SwiftUI
//
//  Created by Dawid Karpiński on 19/09/2022.
//

import Foundation
import Combine

extension Middlewares {
    private static let holidaysRepository = HolidaysRepository()
    
    static let holidays: Middleware<AppState> = { state, action in
        
        switch action {
        case HolidaysActions.fetchHolidays(let countryCode):
            return holidaysRepository.fetchHolidays(code: countryCode)
                .replaceError(with: Holidays())
                .map{ HolidaysActions.didReceiveHolidays($0)}
                .eraseToAnyPublisher()
            
        default:
            return Empty()
                .eraseToAnyPublisher()
        }
    }
}

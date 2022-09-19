//
//  HolidaysReducer.swift
//  HolidayApp_SwiftUI
//
//  Created by Dawid Karpiński on 19/09/2022.
//

import Foundation

extension HolidaysState {
    static let reducer: Reducer<HolidaysState> = { state, action in
        switch action {
        case HolidaysActions.fetchHolidays(let countryCode):
            return HolidaysState.init(holidays: [],
                                      isLoading: true)
        
        case HolidaysActions.didReceiveHolidays(let holidays):
            return HolidaysState.init(holidays: holidays.holidays,
                                      isLoading: false)
            
        default:
            return state
        }
    }
}

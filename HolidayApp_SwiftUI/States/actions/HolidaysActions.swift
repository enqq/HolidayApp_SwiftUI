//
//  HolidaysActions.swift
//  HolidayApp_SwiftUI
//
//  Created by Dawid Karpiński on 19/09/2022.
//

import Foundation

enum HolidaysActions: Action {
    case fetchHolidays(String)
    case didReceiveHolidays(Holidays)
}

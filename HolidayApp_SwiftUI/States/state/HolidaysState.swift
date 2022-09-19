//
//  HolidaysState.swift
//  HolidayApp_SwiftUI
//
//  Created by Dawid Karpiński on 19/09/2022.
//

import Foundation

struct HolidaysState: Codable {
    let holidays: [Holiday]
    let isLoading: Bool
}

extension HolidaysState {
    init() {
        holidays = []
        isLoading = false
    }
}

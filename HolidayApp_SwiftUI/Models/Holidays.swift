//
//  Holidays.swift
//  HolidayApp_SwiftUI
//
//  Created by Dawid Karpiński on 19/09/2022.
//

import Foundation

struct Holidays {
    var holidays: [Holiday]
}

extension Holidays: Codable {
   private enum HolidaysCodingKeys: CodingKey {
        case holidays
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: HolidaysCodingKeys.self)
        holidays = try container.decode([Holiday].self, forKey: .holidays)
    }
    
    func encode(to encoder: Encoder) throws {
        var container =  encoder.container(keyedBy: HolidaysCodingKeys.self)
        try container.encode(self.holidays, forKey: .holidays)
        
    }
}

extension Holidays {
    init() {
        holidays = []
    }
}

/// Single element Holidays List
struct Holiday: Hashable {
    let name: String
    let date: String
    let observed: String
    let country: String
    let weekday: Day
    let weekdayObserved: Day
}
///  Empty model from initializer
extension Holiday {
    init() {
        name = ""
        date = ""
        observed = ""
        country = ""
        weekday = .init()
        weekdayObserved = .init()
    }
}
extension Holiday: Codable {
    private enum HolidayCodingkeys: CodingKey {
        case name, date, observed, country, weekday
    }
    
    private enum WeekdayCodingKeys: CodingKey {
        case date, observed
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: HolidayCodingkeys.self)
        name = try container.decode(String.self, forKey: .name)
        date = try container.decode(String.self, forKey: .date)
        observed = try container.decode(String.self, forKey: .observed)
        country = try container.decode(String.self, forKey: .country)
        
        let weekdayContainer = try container.nestedContainer(keyedBy: WeekdayCodingKeys.self, forKey: .weekday)
        weekday = try weekdayContainer.decode(Day.self, forKey: .date)
        weekdayObserved = try weekdayContainer.decode(Day.self, forKey: .observed)
    }
    
    func encode(to encoder: Encoder) throws {
        var container =  encoder.container(keyedBy: HolidayCodingkeys.self)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.date, forKey: .date)
        try container.encode(self.observed, forKey: .observed)
        try container.encode(self.country, forKey: .country)
        
        var weekdayContainer = container.nestedContainer(keyedBy: WeekdayCodingKeys.self, forKey: .weekday)
        try weekdayContainer.encode(self.weekday, forKey: .date)
        try weekdayContainer.encode(self.weekdayObserved, forKey: .observed)
    }
}
/// Nested element weekday(date and observed)
struct Day: Codable, Hashable {
    let name: String
    let numeric: String
}

///  Empty model from initializer
extension Day {
    init() {
        name = ""
        numeric = ""
    }
}


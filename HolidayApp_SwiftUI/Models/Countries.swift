//
//  Countries.swift
//  HolidayApp_SwiftUI
//
//  Created by Dawid Karpiński on 12/09/2022.
//


import Foundation

/// MARK: Countries List
struct Countries {
    var country: [Country]
}

extension Countries: Codable {
    private enum CountriesCodingKeys: String, CodingKey {
        case country = "countries"
    }
    
    init(from decoder: Decoder) throws {
        let conainer = try decoder.container(keyedBy: CountriesCodingKeys.self)
        country = try conainer.decode([Country].self, forKey: .country)
    }
    
    func encode(to encoder: Encoder) throws {
        var conainer = encoder.container(keyedBy: CountriesCodingKeys.self)
        try conainer.encode(self.country, forKey: .country)
    }
}

extension Countries {
    init() {
        country = []
    }
}

///  MARK: Single element Countries list
struct Country {
    let name: String
    let code: String
}

extension Country {
    init() {
        name = ""
        code = ""
    }
}

extension Country: Identifiable {
    var id: String {
        code
    }
}

extension Country: Codable {
   private  enum CountryCodingKeys: String, CodingKey {
        case name
        case code
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CountryCodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        code = try container.decode(String.self, forKey: .code)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CountryCodingKeys.self)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.code, forKey: .code)
    }
}

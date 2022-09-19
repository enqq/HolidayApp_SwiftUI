//
//  Network.swift
//  HolidayApp_SwiftUI
//
//  Created by Dawid Karpiński on 12/09/2022.
//

import Foundation
import Combine

protocol Networking {
    func GET<T: Decodable>(_ url: URL, params: [String: String]) -> AnyPublisher<T, Error>
}

struct Network: Networking {
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func GET<T>(_ url: URL, params: [String: String]) -> AnyPublisher<T, Error> where T : Decodable {
        var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        var queryItems = urlComponents.queryItems ?? []
        params.forEach { (key: String, value: String) in
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        
        urlComponents.queryItems = queryItems
        return session
            .dataTaskPublisher(for: urlComponents.url!)
            .map(\.data)
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
}

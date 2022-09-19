//
//  HolidayApp_SwiftUIApp.swift
//  HolidayApp_SwiftUI
//
//  Created by Dawid Karpiński on 12/09/2022.
//

import SwiftUI
let store = Store(initial: AppState(countries: CountriesState(), holidays: HolidaysState()), reducer: AppState.reducer, middlewares: [Middlewares.countries, Middlewares.holidays])

@main
struct HolidayApp_SwiftUIApp: App {
    var body: some Scene {

        WindowGroup {
            HomeView()
                .environmentObject(store)
        }
    }
}

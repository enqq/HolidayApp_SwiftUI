//
//  CountryList.swift
//  HolidayApp_SwiftUI
//
//  Created by Dawid Karpiński on 13/09/2022.
//

import SwiftUI

struct CountryList: View {
    @EnvironmentObject var store: Store<AppState>
    @Environment(\.presentationMode) var presentation
    @State private var searchText = ""

    /// Return filter country list by keyworld
    var countriesFilter: [Country] {
        if searchText.isEmpty {
           return store.state.countries.countries
        } else {
          return  store.state.countries.countries
                .filter { $0.name.contains(searchText) || $0.code.contains(searchText)}
        }
    }
    
    var body: some View {
        ZStack {
    
            if store.state.countries.isLoading {
                ProgressView("Please await")
            } else {
                List(countriesFilter) { country in
                        
                    HStack {
                            Text("\(country.code) - \(country.name)")
                            Spacer()
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            self.store.dispatch(CountriesActions.didSelectCountry(country))
                            self.presentation.wrappedValue.dismiss()
                        }
                    
                }  /// End List
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search Country")
                .navigationTitle("Countries")
                
            } /// End else
        } /// End ZStack
        .onAppear {
            self.store.dispatch(CountriesActions.fetchCountries)
        }
    }
}

struct CountryList_Previews: PreviewProvider {
    static var previews: some View {
        CountryList()
            .environmentObject(store)
    }
}

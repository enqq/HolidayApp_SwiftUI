//
//  HomeView.swift
//  HolidayApp_SwiftUI
//
//  Created by Dawid Karpiński on 12/09/2022.
//

import SwiftUI
import Combine

struct HomeView: View {
    @EnvironmentObject var store: Store<AppState>
    private var selectedCountry: Country {
       return store.state.countries.didSelectCountry
    }
    
    var body: some View {
        NavigationView {
        VStack(alignment: .center, spacing: 60) {
            Text("Selected Country")
            
            NavigationLink(destination: CountryList()) {
                Text(selectedCountry.name.isEmpty ? "Search Country" : selectedCountry.name)
            }
            
            HStack {
                
                NavigationLink(destination: HolidayList(countryCode: selectedCountry.code)) {
                    Text("Holidays")
                }
                .disabled(selectedCountry.name.isEmpty)
                
                Spacer()
                
                Button("Clear") {
                    store.dispatch(CountriesActions.clear)
                }
                .disabled(selectedCountry.name.isEmpty)
            }
            .padding()

        } /// End VStack
        .frame(width: 300, height: 240)
        .background(.thinMaterial)
        .cornerRadius(10)
        .navigationBarHidden(true)
    
        } /// End Navigation View
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {

        HomeView()
            .environmentObject(store)
            .previewInterfaceOrientation(.portrait)
    }
}

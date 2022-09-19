//
//  HolidayList.swift
//  HolidayApp_SwiftUI
//
//  Created by Dawid Karpiński on 19/09/2022.
//

import SwiftUI

struct HolidayList: View {
    let countryCode: String
    
    @EnvironmentObject var store: Store<AppState>
    private var holidayState: HolidaysState  {
        store.state.holidays
    }
    
    var body: some View {
        ZStack {
            if holidayState.isLoading {
                ProgressView("Please await")
            } else {
                List(holidayState.holidays, id: \.self) { holiday in
                    
                    NavigationLink(destination: HolidayDetails(holiday: holiday)) {
                        HStack {
                            Text(holiday.name)
                            Spacer()
                            Text(holiday.date)
                                .foregroundColor(.secondary)
                                .font(.subheadline)
                        }
                    }
                } /// End List
            } /// End Else
        } /// End NavigationView
       .navigationTitle("Holidays")
        .onAppear {
            store.dispatch(HolidaysActions.fetchHolidays(countryCode))
        }

    }
}

struct HolidayList_Previews: PreviewProvider {
    static var previews: some View {
        HolidayList(countryCode: "PL")
            .environmentObject(store)
    }
}

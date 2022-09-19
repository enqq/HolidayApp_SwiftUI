//
//  HolidayDetails.swift
//  HolidayApp_SwiftUI
//
//  Created by Dawid Karpiński on 19/09/2022.
//

import SwiftUI

struct HolidayDetails: View {
    var holiday: Holiday
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(holiday.name)
                    .font(.title)
        
                    Text(holiday.country)
                        .font(.headline)
                        .foregroundColor(.secondary)
                
                Divider()
            }
            .padding()
            
            VStack(alignment: .center) {
                Text("Details")
                    .font(.headline)
                
                VStack {
                    HStack{
                        Text("Day: \(holiday.date)")
                        Spacer()
                        Text(holiday.weekday.name)
                    }
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    
                    Text("* Date that the holiday actually occurs.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.bottom, 5)
                
                VStack {
                    HStack{
                        Text("Observed: \(holiday.observed)")
                        Spacer()
                        Text(holiday.weekdayObserved.name)
                    }
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                    
                    Text("* Date that the holiday is observed on. Example, some countries move holidays that land on a weekend to the following Monday. Often times, this value may be the same as date.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                   
                }
            }
        }
    }
}

struct HolidayDetails_Previews: PreviewProvider {
    static var previews: some View {
        let day = Day.init(name: "Monday", numeric: "1")
        let holiday = Holiday.init(name: "Example", date: "26/07/2022", observed: "26/07/2022", country: "Poland", weekday: day, weekdayObserved: day)
        
        HolidayDetails(holiday: holiday)
    }
}

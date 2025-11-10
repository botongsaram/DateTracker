//
//  DateModel.swift
//  DateTracker
//
//  Created by Seung Eun Lee on 11/9/25.
//

import Foundation

enum DateUnit: String {
    case day = "Day"
    case week = "Week"
    case month = "Month"
    case year = "Year"
    
    func dateUnitToString(isSingleUnit: Bool) -> String {
        return "\(self.rawValue)s"
    }
}

struct DateModel {
    struct DateSection {
        let title: String
        var rowItems: [RowItem]
    }

    struct RowItem {
        let id: Int
        let value: String?
        let dateUnit: DateUnit?
    }
    
    let eventDate: Date
    var eventDateString: String {
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .medium
        dateformatter.timeStyle = .none
        return dateformatter.string(from: eventDate)
    }
    
//    var totalElapsed: String? {
//        let calendar = Calendar.current.dateComponents([.day, .month, .year], from: eventDate).value(for: .day, .month, .year)
//        let fommater = DateFormatter()
//        fommater.date(from: <#T##String#>)
//        return
//    }
    
    var day: String? {
        if let day = Calendar.current.dateComponents([.day], from: eventDate, to: Date()).value(for: .day) {
            return String(day)
        }
        return nil
    }
    var week: String? {
        if let week = Calendar.current.dateComponents([.weekOfMonth], from: eventDate, to: Date()).value(for: .weekOfMonth) {
            return String(week)
        }
        return nil
    }
    var month: String? {
        if let month = Calendar.current.dateComponents([.month], from: eventDate, to: Date()).value(for: .month) {
            return String(month)
        }
        return nil
    }
    var year: String? {
        if let year = Calendar.current.dateComponents([.year], from: eventDate, to: Date()).value(for: .year) {
            return String(year)
        }
        return nil
    }

    var viewModel: [DateSection]?
    
    init(eventDate: Date) {
        self.eventDate = eventDate
        self.viewModel = [
            DateSection(title: "Event Date", rowItems: [
                RowItem(id: 1, value: eventDateString, dateUnit: nil)
            ]),
//            DateSection(title: "Total Date Elapsed", rowItems: [RowItem(id: 1, value: eventDateString, dateUnit: nil)]),
            DateSection(title: "Time Elapsed", rowItems: [
                RowItem(id: 1, value: day, dateUnit: .day),
                RowItem(id: 2, value: week, dateUnit: .week),
                RowItem(id: 3, value: month, dateUnit: .month),
                RowItem(id: 4, value: year, dateUnit: .year)
            ])
        ]
    }
}

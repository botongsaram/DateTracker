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
    case other = ""
    
    static func convertComponentToDateUnit(component: Calendar.Component) -> DateUnit {
        switch component {
        case .day:
            return .day
        case .weekOfMonth:
            return .week
        case .month:
            return .month
        case .year:
            return .year
        default:
            return .other
        }
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
        let eventDescription: String?
    }
    
    let eventDate: Date
    var eventDateString: String {
        let dateformatter = DateFormatter()
        dateformatter.dateStyle = .medium
        dateformatter.timeStyle = .none
        return dateformatter.string(from: eventDate)
    }
    
    var totalElapsed: String {
        let components = Calendar.current.dateComponents([.day, .month, .year], from: eventDate, to: Date())
//        print(totalElapsedVals)
        var totalElapsedValue = ""
        if let year = components.year,
           let month = components.month,
           let day = components.day {
            totalElapsedValue = "\(year) year \(month) month \(day) day"
        }
        return totalElapsedValue
    }
    
    private func convertElapsedValueToString(component: Calendar.Component) -> String? {
        if let numberVal = Calendar.current.dateComponents([component], from: eventDate, to: Date()).value(for: component) {
            let unit: DateUnit = DateUnit.convertComponentToDateUnit(component: component)
            let stringVal = "\(numberVal) \(unit.rawValue)"
            return numberVal == 1 ? stringVal : "\(stringVal)s"
        }
        return nil
    }
    
    var day: String? {
        return convertElapsedValueToString(component: .day)
    }
    var week: String? {
        return convertElapsedValueToString(component: .weekOfMonth)
    }
    var month: String? {
        return convertElapsedValueToString(component: .month)
    }
    var year: String? {
        return convertElapsedValueToString(component: .year)
    }

    var viewModel: [DateSection]?
    
    init(eventDate: Date, eventDescription: String) {
        self.eventDate = eventDate
        self.viewModel = [
            DateSection(title: "Event Date", rowItems: [
                RowItem(id: 1, value: eventDateString, eventDescription: nil)
            ]),
            DateSection(title: "Total Date Elapsed", rowItems: [RowItem(id: 1, value: totalElapsed, eventDescription: eventDescription)]),
            DateSection(title: "Time Elapsed", rowItems: [
                RowItem(id: 1, value: day, eventDescription: eventDescription),
                RowItem(id: 2, value: week, eventDescription: eventDescription),
                RowItem(id: 3, value: month, eventDescription: eventDescription),
                RowItem(id: 4, value: year, eventDescription: eventDescription)
            ])
        ]
    }
}

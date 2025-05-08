//
//  FormatHour.swift
//  Reminder
//
//  Created by Gustavo Holzmann on 08/05/25.
//

import Foundation

extension Date {
    var formattedHourAndDay: String {
        return formatHourAndDay(self)
    }
}

func formatHourAndDay(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.timeZone = TimeZone(abbreviation: "UTC")
    formatter.dateFormat = "E, HH:mm"
    return formatter.string(from: date)
}

//
//  Date+Extensions.swift
//  BetterWeather
//
//  Created by Aayush Pokharel on 2021-10-22.
//

import Foundation

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}

func epochToHour(for epoch: Int) -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(epoch))
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "ha"
    let dayInWeek = dateFormatter.string(from: date)
    return dayInWeek
}

func epochToDay(for epoch: Int) -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(epoch))
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE, MMM d"
    let dayInWeek = dateFormatter.string(from: date)
    return dayInWeek
}

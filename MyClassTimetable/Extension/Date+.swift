//
//  Date+.swift
//  MyClassTimetable
//
//  Created by Jaewon on 2022/06/05.
//

import Foundation

extension Date {
    func afterMinute(_ minute: Int) -> Date? {
        return Calendar.current.date(byAdding: .minute, value: minute, to: self)
    }
}

//
//  Lecture.swift
//  MyClassTimetable
//
//  Created by Jaewon on 2022/06/05.
//

import Foundation

struct Lecture {
    var name: String
    var startTime: Int
    var count: Int
    var endTime: Int {
        startTime + count
    }
    var weekday: Weekday
}

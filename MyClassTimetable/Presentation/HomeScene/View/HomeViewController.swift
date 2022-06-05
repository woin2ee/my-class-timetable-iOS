//
//  HomeViewController.swift
//  MyClassTimetable
//
//  Created by Jaewon on 2022/06/02.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    @IBOutlet weak var timetableStackView: UIStackView!
    
    let timeSet = ["09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00"]
    
    var lectureList: [Lecture] = [Lecture(startTime: 1, count: 3), Lecture(startTime: 3, count: 4)]
    var firstLectureTime: Int {
        return lectureList.min {
            return $0.startTime < $1.startTime
        }?.startTime ?? timeSet.startIndex
    }
    var lastLectrueTime: Int {
        return lectureList.max {
            return $0.endTime < $1.endTime
        }?.endTime ?? timeSet.endIndex

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHomeView()
    }
    
    func setupHomeView() {
        for time in firstLectureTime..<lastLectrueTime {
            timetableStackView.addArrangedSubview(TimetableBackgroundElementView(time: timeSet[time]))
        }
    }
}

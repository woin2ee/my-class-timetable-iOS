//
//  HomeViewController.swift
//  MyClassTimetable
//
//  Created by Jaewon on 2022/06/02.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    @IBOutlet weak var timetableBackground: UIStackView!
    @IBOutlet weak var timetableLecture: UIView!
    
    let timeSet = ["09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00"]
    
    var lectureList: [Lecture] = [
        Lecture(name: "A", startTime: 1, count: 2, weekday: .monday),
        Lecture(name: "B", startTime: 2, count: 2, weekday: .tuesday)]
    
    var firstLectureTime: Int {
        lectureList.min {
            $0.startTime < $1.startTime
        }?.startTime ?? timeSet.startIndex
    }
    var lastLectrueTime: Int {
        lectureList.max {
            $0.endTime < $1.endTime
        }?.endTime ?? timeSet.endIndex
    }
    var totalLectureTime: Int {
        lastLectrueTime - firstLectureTime
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        addLectureView(lecture: lectureList[0])
    }
    
    func addLectureView(lecture: Lecture) {
        let lectureView = LectureView(lecture: lecture)
        timetableBackground.addSubview(lectureView)
        setContraints(lectureView: lectureView)
    }
    
    func setContraints(lectureView: LectureView) {
        let width = timetableLecture.frame.width / CGFloat(Weekday.count)
        let height = timetableLecture.frame.height / CGFloat(totalLectureTime) * CGFloat(lectureView.lecture?.count ?? 0)
        
        lectureView.snp.makeConstraints {
            $0.width.equalTo(width)
            $0.height.equalTo(height)
            $0.top.equalTo(timetableLecture)
            $0.leading.equalTo(timetableLecture)
        }
    }
    
    func setupBackground() {
        for time in 0..<totalLectureTime {
            let bgElement = TimetableBackgroundElementView(time: timeSet[time])
            bgElement.layer.borderColor = CGColor(gray: 0, alpha: 1.0)
            bgElement.layer.borderWidth = 1.0
            timetableBackground.addArrangedSubview(bgElement)
        }
    }
}

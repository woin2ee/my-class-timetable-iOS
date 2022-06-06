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
    
    var timetableViewHeight: CGFloat {
        timetableStackView.frame.size.height
    }
    var timetableViewSafetyWidth: CGFloat {
        timetableStackView.frame.size.width - timeLabelWidth
    }
    var timeLabelWidth: CGFloat {
        50
    }
    
    let timeSet = ["09:00", "10:00", "11:00", "12:00", "13:00", "14:00", "15:00", "16:00", "17:00", "18:00", "19:00"]
    
    var lectureList: [Lecture] = [
        Lecture(name: "A", startTime: 1, count: 3, weekday: .monday),
        Lecture(name: "B", startTime: 3, count: 3, weekday: .tuesday)]
    
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
        setupHomeView()
        
        addLectureView(lecture: lectureList[0])
        
    }
    
    func addLectureView(lecture: Lecture) {
        let lectureView = LectureView(lecture: lecture)
        view.addSubview(lectureView)
        setContraints(lectureView: lectureView)
    }
    
    func setContraints(lectureView: LectureView) {
        let width = timetableViewSafetyWidth / 5.0
        let height = timetableViewHeight / CGFloat(totalLectureTime) * CGFloat(lectureView.lecture?.count ?? 0)
        lectureView.snp.makeConstraints {
            $0.width.equalTo(width)
            $0.height.equalTo(height)
            $0.top.equalTo(self.timetableStackView)
            $0.leading.equalTo(self.timeLabelWidth)
        }

    }
    
    func setupHomeView() {
        for time in firstLectureTime..<lastLectrueTime {
            timetableStackView.addArrangedSubview(TimetableBackgroundElementView(time: timeSet[time]))
        }
    }
}

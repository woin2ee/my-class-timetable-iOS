//
//  MainViewController.swift
//  MyClassTimetable
//
//  Created by Jaewon on 2022/06/02.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    @IBOutlet weak var timetableStackView: UIStackView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        for _ in 0..<9 {
            timetableStackView.addArrangedSubview(TimetableBackgroundElementView())
        }
    }
}

struct LectureInfo {
    
    
}

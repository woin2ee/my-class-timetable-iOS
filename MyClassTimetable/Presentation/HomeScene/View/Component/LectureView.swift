//
//  LectureView.swift
//  MyClassTimetable
//
//  Created by Jaewon on 2022/06/05.
//

import UIKit

class LectureView: UIView {
    @IBOutlet weak var lectureName: UILabel!
    
    var lecture: Lecture?
    
    convenience init(lecture: Lecture) {
        self.init(frame: CGRect())
        self.lecture = lecture
        viewInit()
        makeView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func viewInit() {
        let name = String(describing: type(of: self))
        guard let view = Bundle.main.loadNibNamed(name, owner: self)?.first as? UIView else { return }
        view.frame = self.bounds
        addSubview(view)
    }
    
    func makeView() {
        lectureName.text = lecture?.name
    }
}

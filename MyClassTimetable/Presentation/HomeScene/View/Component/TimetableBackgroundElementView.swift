//
//  TimetableBackgroundElementView.swift
//  MyClassTimetable
//
//  Created by Jaewon on 2022/06/02.
//

import UIKit

class TimetableBackgroundElementView: UIView {
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    
    let minuteOfHour = 60
    let breakTime = 10
    
    convenience init(time: String) {
        self.init(frame: CGRect())
        viewInit()
        setTime(by: time)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTime(by time: String) {
        self.startTime.text = time
        
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let date = formatter.date(from: time)
        guard let endTime = date?.afterMinute(minuteOfHour - breakTime) else {
            return self.endTime.text = time
        }
        self.endTime.text = formatter.string(from: endTime)
    }
    
    func viewInit() {
        let name = String(describing: type(of: self))
        guard let view = Bundle.main.loadNibNamed(name, owner: self)?.first as? UIView else { return }
        view.frame = self.bounds
        addSubview(view)
    }
}

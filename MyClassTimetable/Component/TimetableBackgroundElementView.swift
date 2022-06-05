//
//  TimetableBackgroundElementView.swift
//  MyClassTimetable
//
//  Created by Jaewon on 2022/06/02.
//

import UIKit

class TimetableBackgroundElementView: UIView {
    convenience init() {
        self.init(frame: CGRect())
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewInit()
    }
    
    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        
        super.init(coder: coder)
        viewInit()
    }
    
    func viewInit() {
        let name = String(describing: type(of: self))
        guard let view = Bundle.main.loadNibNamed(name, owner: self)?.first as? UIView else { return }
        view.frame = self.bounds
        addSubview(view)
    }
}

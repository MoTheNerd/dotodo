//
//  TaskButton.swift
//  dotodo
//
//  Created by Mohammad Al-Ahdal on 2018-01-22.
//  Copyright © 2018 Mohammad Al-Ahdal. All rights reserved.
//

import UIKit

class TaskButton: UIView {
    
    @IBOutlet var taskButton: UIView!
    @IBOutlet weak var taskNameLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit();
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit(){
        
        Bundle.main.loadNibNamed("TaskButton", owner: self, options: nil)
        addSubview(taskButton)
        taskButton.frame = self.bounds
        taskButton.autoresizingMask = [.flexibleWidth]
        
        
    }
    
}

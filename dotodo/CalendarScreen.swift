//
//  CalendarScreen.swift
//  dotodo
//
//  Created by Mohammad Al-Ahdal on 2018-04-12.
//  Copyright © 2018 Mohammad Al-Ahdal. All rights reserved.
//

import UIKit

class CalendarScreen : UIViewController {
    
    var calCells : [CalendarCell] = [];
    
    override func viewDidAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor.red;
        for day in 0...34 {
            calCells.append(CalendarCell(sender: self, day: day));
        }
    }
    
}

class CalendarCell: UIView {
    
    var day: Int!;
    var activated: Bool!;
    var active:Bool!;
    var offset = 50;
    
    init(sender: CalendarScreen, day: Int){
        self.day = day;
        let col:Int = day % 7;
        let row:Int = day / 7;
        super.init(frame: CGRect(x: sender.view.frame.width/7 * CGFloat(col),y: sender.view.frame.width/7 * CGFloat(row) + CGFloat(offset), width: sender.view.frame.width/7 ,height: sender.view.frame.width/7))
        self.backgroundColor = UIColor.purple;
        
        if (Clockwork.checkDateActive(dayNo: self.day)) {
            self.backgroundColor = UIColor.white;
        }
    
        
        
        sender.view.addSubview(self);
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func activate(){
        
    }
    
    func deactivate(){
        
    }
    
    static func deactivateAll(){
        // this should deactivate the rest of the views
    }
}

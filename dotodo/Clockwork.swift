//
//  Clockwork.swift
//  dotodo
//
//  Created by Mohammad Al-Ahdal on 2018-04-15.
//  Copyright © 2018 Mohammad Al-Ahdal. All rights reserved.
//

import Foundation

class Clockwork {
    
    static var today: Date!;
    static var cal: Calendar!;
    
    
    static func checkDateActive (dayNo: Int) -> Bool {
        Clockwork.today = Date(); // set today to today
        Clockwork.cal = Calendar.current;
        
        let year = Clockwork.cal.component(Calendar.Component.year, from: today)
        let month = Clockwork.cal.component(Calendar.Component.month, from: today)
        
        var daysTotal: Int = 0;
        
        if (month == 2 && year%4 == 0){
            daysTotal = 29;
        }else if (month == 2) {
            daysTotal = 28;
        }else{
            if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12){
                daysTotal = 31;
            }else{
                daysTotal = 30;
            }
        }
        
        //need to figure out what day month started on.
        let components = Clockwork.cal.dateComponents([Calendar.Component.year, Calendar.Component.month], from: today)
        let startDate = Clockwork.cal.date(from: components)
        let startDay = Clockwork.cal.component(Calendar.Component.weekday, from: startDate!);
        
        
        if (dayNo+1 >= startDay && dayNo+1 < daysTotal+startDay) {
            return true;
        }
        
        //print(weekday);
        
        return false;
    }
    
    
    
}

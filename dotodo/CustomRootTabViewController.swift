//
//  CustomRootTabViewController.swift
//  dotodo
//
//  Created by Mohammad Al-Ahdal on 2018-04-12.
//  Copyright © 2018 Mohammad Al-Ahdal. All rights reserved.
//

import UIKit

class CustomRootTabController : UIViewController {
    
    // K.I.S.S.
    // we're going to have 3 views
    // a calendar view
    // an add task view with current tasks
    // a settings view
    
    var calendarScreen: CalendarScreen!;
    var tasksScreen: TasksScreen!;
    var settingsScreen: SettingsScreen!;
    //might move these up a level...
    
    
    var xint1:CGFloat!; // intermediate starting x
    var xstart:CGFloat!; // x starting
    var xend:CGFloat!; // x ending
    var xint2:CGFloat!; // intermediate ending x
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    override func viewDidAppear(_ animated: Bool) {
        calendarScreen = CalendarScreen();
        tasksScreen = TasksScreen();
        settingsScreen = SettingsScreen();
        // make the screens
        
        self.view.addSubview(calendarScreen.view);
        self.view.addSubview(tasksScreen.view);
        self.view.addSubview(settingsScreen.view);
        // add them to view
        
        calendarScreen.view.frame.origin.x -= self.view.frame.width;
        settingsScreen.view.frame.origin.x += self.view.frame.width;
        //displace calendar and settings such that Calendar>>>>>Tasks>>>>>Settings
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.xstart = touches.first!.location(in: self.view).x;
        self.xint1 = xstart;
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.xend = touches.first!.location(in: self.view).x;
        
        
        let caldist = abs(calendarScreen.view.frame.origin.x - self.view.frame.origin.x);
        let taskdist = abs(tasksScreen.view.frame.origin.x - self.view.frame.origin.x);
        let settdist = abs(settingsScreen.view.frame.origin.x - self.view.frame.origin.x);
        
        if (caldist <= taskdist && caldist <= settdist){
            //move to calendar
            
            UIView.animate(withDuration: 0.3, animations: {
                self.calendarScreen.view.frame.origin.x = self.view.frame.origin.x + self.view.frame.width*0
                self.tasksScreen.view.frame.origin.x = self.view.frame.origin.x + self.view.frame.width*1
                self.settingsScreen.view.frame.origin.x = self.view.frame.origin.x + self.view.frame.width*2
            });
            
        }else if (taskdist <= caldist && taskdist <= settdist){
            //move to tasks
            
            UIView.animate(withDuration: 0.3, animations: {
                self.calendarScreen.view.frame.origin.x = self.view.frame.origin.x - self.view.frame.width*1
                self.tasksScreen.view.frame.origin.x = self.view.frame.origin.x + self.view.frame.width*0
                self.settingsScreen.view.frame.origin.x = self.view.frame.origin.x + self.view.frame.width*1
            });
            
        }else if (settdist <= caldist && settdist <= taskdist){
            //move to settings
            
            UIView.animate(withDuration: 0.3, animations: {
                self.calendarScreen.view.frame.origin.x = self.view.frame.origin.x - self.view.frame.width*2
                self.tasksScreen.view.frame.origin.x = self.view.frame.origin.x - self.view.frame.width*1
                self.settingsScreen.view.frame.origin.x = self.view.frame.origin.x - self.view.frame.width*0
            });
            
        }
        
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.xint2 = touches.first!.location(in: self.view).x;
        
        if (calendarScreen.view.frame.origin.x >= self.view.frame.origin.x && xint2! >= xint1!) {
            calendarScreen.view.frame.origin.x = self.view.frame.origin.x + self.view.frame.width*0
            tasksScreen.view.frame.origin.x = self.view.frame.origin.x + self.view.frame.width*1
            settingsScreen.view.frame.origin.x = self.view.frame.origin.x + self.view.frame.width*2
        } else if (settingsScreen.view.frame.origin.x <= self.view.frame.origin.x && xint1! >= xint2!){
            calendarScreen.view.frame.origin.x = self.view.frame.origin.x - self.view.frame.width*2
            tasksScreen.view.frame.origin.x = self.view.frame.origin.x - self.view.frame.width*1
            settingsScreen.view.frame.origin.x = self.view.frame.origin.x - self.view.frame.width*0
        } else {
            calendarScreen.view.frame.origin.x += xint2!-xint1!
            settingsScreen.view.frame.origin.x += xint2!-xint1!
            tasksScreen.view.frame.origin.x += xint2!-xint1!
        }
        
        xint1 = xint2;
    }
    
    
    
}

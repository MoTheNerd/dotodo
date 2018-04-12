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
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    override func viewDidAppear(_ animated: Bool) {
        calendarScreen = CalendarScreen();
        tasksScreen = TasksScreen();
        settingsScreen = SettingsScreen();
        
        
        self.view.addSubview(calendarScreen.view);
        self.view.addSubview(tasksScreen.view);
        self.view.addSubview(settingsScreen.view);
        
        
        calendarScreen.view.frame.origin.x -= self.view.frame.width;
        settingsScreen.view.frame.origin.x += self.view.frame.width;
    }
    
    
    
}

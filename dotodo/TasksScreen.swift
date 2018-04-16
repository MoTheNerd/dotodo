//
//  TasksScreen.swift
//  dotodo
//
//  Created by Mohammad Al-Ahdal on 2018-04-12.
//  Copyright © 2018 Mohammad Al-Ahdal. All rights reserved.
//

import UIKit
import IGListKit

class TasksScreen : UIViewController {
    
    var data: [TaskCell]!
    var addDataButton: TaskAddButton!;
    
    override func viewDidAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor.cyan;
        addDataButton = TaskAddButton(frame: CGRect(x: self.view.frame.width/2-25, y: self.view.frame.height - 75, width: 50, height: 50));
        self.view.addSubview(addDataButton);
        self.populateData();
    }
    
    func populateData() {
        data = [
        TaskCell(sender: self, label: "Step 1", theme: 0x1),
        TaskCell(sender: self, label: "Step 2", theme: 0x2),
        TaskCell(sender: self, label: "Step 3", theme: 0x3),
        TaskCell(sender: self, label: "Step 4", theme: 0x1),
        TaskCell(sender: self, label: "Step 5", theme: 0x2),
        TaskCell(sender: self, label: "Step 6", theme: 0x3),
        TaskCell(sender: self, label: "Step 7", theme: 0x1),
        TaskCell(sender: self, label: "Step 8", theme: 0x2)
        ];
        //temporary to populate data and then showData()
    }
    
}

class TaskCell : UIView{
    
    var labelString: String!;
    var theme: Int!;
    private static var currentCount: Int = 0; // starts at 0, I know, I'm sorry
    var offset = 50;
    
    
    
    init (sender: TasksScreen, label: String, theme: Int){
        super.init(frame: CGRect(x: 0, y: CGFloat.init(self.offset + 56 * TaskCell.currentCount), width: sender.view.frame.width, height: 56));
        self.labelString = label;
        self.theme = theme;
        self.updateTheme();
        TaskCell.currentCount += 1;
        
        let uiLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        uiLabel.text = self.labelString
        self.addSubview(uiLabel);
        uiLabel.sizeToFit();
        uiLabel.frame = CGRect(x: 0, y: self.frame.height/2 - uiLabel.frame.height/2, width: uiLabel.frame.width, height: uiLabel.frame.height);
        
        
        sender.view.addSubview(self);
    }
    
    func updateTheme(){
        switch self.theme {
        case 1:
            backgroundColor = UIColor.blue;
            break;
        case 2:
            backgroundColor = UIColor.red;
            break;
        case 3:
            backgroundColor = UIColor.purple;
            break;
        default:
            break;
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented");
    }
}


class TaskAddButton : UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.black
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // prompt new card
        print("New Card!")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

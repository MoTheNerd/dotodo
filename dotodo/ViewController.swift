//
//  ViewController.swift
//  dotodo
//
//  Created by Mohammad Al-Ahdal on 2018-01-22.
//  Copyright © 2018 Mohammad Al-Ahdal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var taskButton: TaskButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.taskButton.taskNameLabel.text = "SWAG"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


//
//  LoginScreen.swift
//  dotodo
//
//  Created by Mohammad Al-Ahdal on 2018-04-12.
//  Copyright © 2018 Mohammad Al-Ahdal. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginScreen : UIViewController {
    
    var usernameTextField: UITextField!;
    var passwordTextField: UITextField!;
    var loginButton: LoginButton!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        
    }
    
}

class LoginButton: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}

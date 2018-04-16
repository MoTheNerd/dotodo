//
//  LoginScreen.swift
//  dotodo
//
//  Created by Mohammad Al-Ahdal on 2018-04-12.
//  Copyright © 2018 Mohammad Al-Ahdal. All rights reserved.
//

import UIKit
import FirebaseAuth

var firUser:User!;

class LoginScreen : UIViewController {
    
    var usernameTextField: UITextField!;
    var passwordTextField: UITextField!;
    var loginButton: LoginButton!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated);
        loginButton = LoginButton(frame: CGRect(x: 0, y: self.view.frame.height-156, width: self.view.frame.width, height: 56.0), sender: self);
        self.view.addSubview(loginButton);
    }
    
}

class LoginButton: UIView {
    
    var sender:LoginScreen!;
    
    init(frame: CGRect, sender: LoginScreen) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blue;
        self.sender = sender;
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Try validating
        print("Validating...");
        self.validate();
    }
    
    func validate(){
        Auth.auth().signIn(withEmail: "mohammad@enggmomo.me", password: "MoomMoom", completion: {(user, error) in
            if (error == nil) {
                //auth was a success
                firUser = user!;
                self.sender.performSegue(withIdentifier: "authSuccess", sender: self.sender);
                //update UID and rest
            }else{
                print(error!.localizedDescription);
            }
            
        });
    }
    
}

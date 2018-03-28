//
//  TempViewController.swift
//  Surikatta
//
//  Created by Tanya Berezovsky on 21/03/2018.
//  Copyright © 2018 Tanya Berezovsky. All rights reserved.
//

import UIKit

class Login1ViewController: UIViewController, LoginViewDelegate {
    private var loginView: LoginView!

    override func viewDidLoad() {
        super.viewDidLoad()
        loginView = LoginView()
        if let loginView = self.loginView {
            loginView.delegate = self
            view.addSubview(loginView)
            loginView.frame = self.view.bounds
            loginView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        }
    }

    func loginButtonWasPressed() {
        print("button Login Was Pressed")
    }
 }

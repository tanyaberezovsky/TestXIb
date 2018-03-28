//
//  LoginView.swift
//  TestXIb
//
//  Created by Tanya Berezovsky on 28/03/2018.
//  Copyright © 2018 Tanya Berezovsky. All rights reserved.
//

import UIKit
import UIKit
// Simple delegate protocol.
protocol LoginViewDelegate: class {
    func loginButtonWasPressed()
}

@IBDesignable
class LoginView: UIView {
    weak var delegate: LoginViewDelegate?
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        let nibName = "LoginView"
        Bundle.main.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    @IBAction func loginButtonWasPressed(_ sender: UIButton) {
        delegate?.loginButtonWasPressed()
    }
}





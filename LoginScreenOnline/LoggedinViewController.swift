//
//  LoggedinViewController.swift
//  LoginScreenOnline
//
//  Created by Ant Colony on 7. 12. 2021..
//

import UIKit

class LoggedinViewController: UIViewController {
    
    var accessToken: String? = nil
    var refreshToken: String? = nil
    
    
    @IBOutlet weak var accessTokenTextView: UITextView!
    @IBOutlet weak var refreshTokenTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        accessTokenTextView.text = accessToken
        refreshTokenTextView.text = refreshToken
    }
}

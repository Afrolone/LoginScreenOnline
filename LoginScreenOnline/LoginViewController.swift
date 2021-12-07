//
//  ViewController.swift
//  LoginScreenOnline
//
//  Created by Ant Colony on 7. 12. 2021..
//

//email: "adi.palavra@antcolony.io"
//password: "1Dvatri!"

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    let URL: String = "https://edu-stream-dev.herokuapp.com/api/auth/login"
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func onLoginButtonClicked(_ sender: Any) {
        print("FUNCTION CALLED!")
        if let email = emailTextField.text, let password = passwordTextField.text {
                makeLoginRequest(email: email, password: password)
        }
        
    }
    
    private func makeLoginRequest(email: String, password: String) {
        let login = Login(email: email, password: password)
        var loginResponseToBeReturned: LoginResponse? = nil
        
        AF.request(URL,
                   method: .post,
                   parameters: login,
                   encoder: URLEncodedFormParameterEncoder.default)
            .validate()
            .responseDecodable(of: LoginResponse.self) { response in
                switch response.result {
                case .success(let data):
                    let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoggedinViewController") as! LoggedinViewController
                    vc.accessToken = data.accessToken
                    vc.refreshToken = data.refreshToken
                    self.navigationController?.pushViewController(vc, animated: true)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
}


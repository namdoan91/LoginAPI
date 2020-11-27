//
//  ViewController.swift
//  LoginApi
//
//  Created by namit on 27/11/2020.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var dangnhapText: UITextField!
    @IBOutlet weak var matkhauText: UITextField!
    @IBOutlet weak var dangnhapbtN: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func btnLogin(_ sender: Any) {
        let phone = dangnhapText.text!
        let password = matkhauText.text!
        
        login(phone, password)
        
    }
    func login(_ phone: String, _ password: String){
        let url = "http://report.bekhoe.vn/api/accounts/login"
        let header : HTTPHeaders = ["Content-Type":"application/x-www-form-urlencoded"]
        let par = ["PhoneNumber": phone ,
                   "Password": password]
        AF.request(url, method: .post, parameters: par, encoding: URLEncoding.httpBody , headers: header).responseJSON { (response) in
                       print(response)
                    switch response.result {
                    case .success(let value) :
                        let json = JSON(value)
                        let code = json["code"].intValue
                        if code == 0{
                            let data = User(json: json["data"])
                            if let token = data?.token {
                                UserDefaults.standard.setValue(token, forKey: "token")
                                print(token)
                            }
                            let profileVC = Profile()
                            let navigationController = UINavigationController.init(rootViewController: profileVC)
                            navigationController.modalPresentationStyle = .fullScreen
                            self.present(navigationController, animated: true, completion: nil)
                        }else{
                            let message = json["message"].stringValue
                            print(message)
                        }
                    case .failure(let err):
                        print(err)
                    }
                }
            
        }
    }
    



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
        dangnhapText.attributedPlaceholder = NSAttributedString(string: "Tài Khoản Của Bạn" , attributes: NSAttributedString.key.for)
        
    }

    @IBAction func btnLogin(_ sender: Any) {
        let phone = dangnhapText.text!
        let password = matkhauText.text!
        
        login(phone, password)
        
    }
    func login(_ phone: String, _ password: String){
        let url = "http://report.bekhoe.vn/api/accounts/login"
        let header : HTTPHeaders = ["Content-Type":"application/x-www-form-urlencoded"]
        //MARK: -- nhập vào ô textfield
        let par = ["PhoneNumber": phone ,
                   "Password": password]
        //MARK: -- gán cứng textfield sẵn
//        let par = ["PhoneNumber": "0942961413" ,
//                   "Password": "123"]
        
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
                            }
                            let profileVC = Profile()
//                            MARK:-- Truyền data sáng Profile
                            profileVC.userName = data?.name
                            profileVC.token = (data?.token)!
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
    



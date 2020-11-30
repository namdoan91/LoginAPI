//
//  ViewController.swift
//  LoginApi
//
//  Created by namit on 27/11/2020.
//

import UIKit
import Alamofire
import SwiftyJSON
import SkyFloatingLabelTextField

class ViewController: UIViewController {

    @IBOutlet weak var dangnhapText: SkyFloatingLabelTextField!
    @IBOutlet weak var matkhauText: SkyFloatingLabelTextField!
    @IBOutlet weak var dangnhapbtN: UIButton!
    @IBOutlet weak var dangkiBTN: UIButton!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        placeHolder()
    }
    override func viewWillAppear(_ animated: Bool) {

    }

    @IBAction func btnLogin(_ sender: Any) {
        let phone = dangnhapText.text!
        let password = matkhauText.text!
        login(phone, password)
        
    }
    

    @IBAction func btnRegister(_ sender: Any) {
        let registerVC = Register()
        let registerNavi = UINavigationController.init(rootViewController: registerVC)
//        registerNavi.modalPresentationStyle = .fullScreen
        self.present(registerNavi, animated: true, completion: nil)
    }
    
    func placeHolder(){
//        self.dangnhapText.attributedPlaceholder = NSAttributedString(string: "Tài Khoản Của Bạn", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
//        self.dangnhapText.selectedTitleColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 1.0)
//        self.dangnhapText.selectedLineColor = UIColor(red: 0, green: 187/255, blue: 204/255, alpha: 1.0)
//        matkhauText.attributedPlaceholder = NSAttributedString(string: "Mật Khẩu Của Bạn", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        dangnhapText.layer.cornerRadius = 20
        dangnhapText.layer.masksToBounds = true
        dangnhapText.textAlignment = .center
        dangnhapText.titleLabel.textAlignment = .center
        dangnhapText.clipsToBounds = true
        matkhauText.layer.cornerRadius = 20
        matkhauText.clipsToBounds = true
        matkhauText.textAlignment = .center
        matkhauText.titleLabel.textAlignment = .center
        
              
    }
    func login(_ phone: String, _ password: String){
        let url = "http://report.bekhoe.vn/api/accounts/login"
        let header : HTTPHeaders = ["Content-Type":"application/x-www-form-urlencoded"]
        //MARK: -- nhập vào ô textfield
        let par = ["PhoneNumber": phone ,
                   "Password": password]
        if self.dangnhapText.text! == "" {
            let alert = UIAlertController(title: "Thông Báo", message: "Vui Lòng Điền Tài Khoản", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Quay Lại", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return;
        }
        if self.matkhauText.text! == ""{
            let alert = UIAlertController(title: "Thông Báo", message: "Vui Lòng Điền Mật Khẩu", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Quay Lại", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return;
        }
        //MARK: -- gán cứng textfield sẵn
//        let par = ["PhoneNumber": "0942961413" ,
//                   "Password": "123"]
        
        AF.request(url, method: .post, parameters: par, encoding: URLEncoding.httpBody , headers: header).responseJSON { (response) in
                       print(response)
                    switch response.result {
                    case .success(let value) :
                        let json = JSON(value)
                        let code = json["code"].intValue
                        if code == 500{
                            let alert = UIAlertController(title: "Thông Báo", message: "Tài Khoản Hoặc Mật Khẩu Không Đúng", preferredStyle: UIAlertController.Style.alert)
                            alert.addAction(UIAlertAction(title: "Quay Lại", style: UIAlertAction.Style.default, handler: nil))
                            self.present(alert, animated: true, completion: nil)
                            return;
                        }
                        if code == 0{
                            let data = User(json: json["data"])
                            if let token = data?.token {
                                UserDefaults.standard.setValue(token, forKey: "token")
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
    



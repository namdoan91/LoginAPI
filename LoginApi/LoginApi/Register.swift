//
//  Register.swift
//  LoginApi
//
//  Created by namit on 29/11/2020.
//

import UIKit
import Alamofire
import SwiftyJSON
import SkyFloatingLabelTextField
import TextFieldEffects

class Register: UIViewController {
    let container:UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = UIColor.white
        container.clipsToBounds = true
        return container
    }()
    let stackview: UIStackView = {
        let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        stackview.layer.cornerRadius = 20
        stackview.clipsToBounds = true
        return stackview
    }()
    let logoImage: UIImageView = {
        let imageLogo = UIImageView()
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        imageLogo.image = UIImage(named: "logo")
        imageLogo.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        imageLogo.clipsToBounds = true
        return imageLogo
    }()
    let userName: TextFieldEffects = {
        let password = KaedeTextField(frame: CGRect(x: 0, y: 0, width: 130, height: 10))
        password.translatesAutoresizingMaskIntoConstraints = false
        password.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        password.layer.cornerRadius = 10
        password.clipsToBounds = true
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: password.frame.height))
        password.leftViewMode = .always
        password.clearsOnBeginEditing = true
        password.foregroundColor = UIColor.gray.withAlphaComponent(0.5)
        password.placeholder = "Họ Và Tên"
        password.placeholderColor = UIColor.white
        return password
    }()
    let password: TextFieldEffects = {
        let password = KaedeTextField(frame: CGRect(x: 0, y: 0, width: 130, height: 10))
        password.translatesAutoresizingMaskIntoConstraints = false
        password.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        password.layer.cornerRadius = 10
        password.clipsToBounds = true
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: password.frame.height))
        password.leftViewMode = .always
        password.clearsOnBeginEditing = true
        password.foregroundColor = UIColor.gray.withAlphaComponent(0.5)
        password.placeholder = "Mật Khẩu"
        password.placeholderColor = UIColor.white
        return password
    }()
    let phonenumber: TextFieldEffects = {
        let phonenumber = KaedeTextField(frame: CGRect(x: 0, y: 0, width: 130, height: 10))
        phonenumber.translatesAutoresizingMaskIntoConstraints = false
        phonenumber.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        phonenumber.layer.cornerRadius = 10
        phonenumber.clipsToBounds = true
        phonenumber.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: phonenumber.frame.height))
        phonenumber.leftViewMode = .always
        phonenumber.clearsOnBeginEditing = true
        phonenumber.foregroundColor = UIColor.gray.withAlphaComponent(0.5)
        phonenumber.placeholder = "Số Đ.Thoại"
        phonenumber.placeholderColor = UIColor.white
        return phonenumber
    }()
    let address: TextFieldEffects = {
        let phonenumber = KaedeTextField(frame: CGRect(x: 0, y: 0, width: 130, height: 10))
        phonenumber.translatesAutoresizingMaskIntoConstraints = false
        phonenumber.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        phonenumber.layer.cornerRadius = 10
        phonenumber.clipsToBounds = true
        phonenumber.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: phonenumber.frame.height))
        phonenumber.leftViewMode = .always
        phonenumber.clearsOnBeginEditing = true
        phonenumber.foregroundColor = UIColor.gray.withAlphaComponent(0.5)
        phonenumber.placeholder = "Địa Chỉ"
        phonenumber.placeholderColor = UIColor.white
        return phonenumber
    }()
    let email: TextFieldEffects = {
        let phonenumber = KaedeTextField(frame: CGRect(x: 0, y: 0, width: 130, height: 10))
        phonenumber.translatesAutoresizingMaskIntoConstraints = false
        phonenumber.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        phonenumber.layer.cornerRadius = 10
        phonenumber.clipsToBounds = true
        phonenumber.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: phonenumber.frame.height))
        phonenumber.leftViewMode = .always
        phonenumber.clearsOnBeginEditing = true
        phonenumber.foregroundColor = UIColor.gray.withAlphaComponent(0.5)
        phonenumber.placeholder = "Email"
        phonenumber.placeholderColor = UIColor.white
        return phonenumber
    }()
    let register: UIButton = {
        let register = UIButton()
        register.translatesAutoresizingMaskIntoConstraints = false
        register.setTitle("Gửi Đăng Kí", for: .normal)
        register.backgroundColor = UIColor(red:0.749, green:0.749, blue:0.749, alpha: 1.000)
        register.titleLabel?.font = UIFont.init(name: "Arial", size: 15)
        register.layer.cornerRadius = 10
        return register
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSub()
        setLayout()
        let signOutButton = UIBarButtonItem(image: UIImage.init(systemName: "chevron.left.circle.fill"), style: .done, target: self, action: #selector(back))
        let signOutButton1 = UIBarButtonItem(title: "Quay Lại", style: UIBarButtonItem.Style.done, target: self, action: #selector(back))
        navigationItem.leftBarButtonItems = [signOutButton,signOutButton1]
        navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController!.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        register.addTarget(self, action: #selector(registerTap), for: .touchUpInside)
    }
    @objc func back(){
        dismiss(animated: true, completion: nil)
    }

    func addSub(){
        view.addSubview(container)
        container.addSubview(stackview)
        stackview.addSubview(logoImage)
        stackview.addSubview(userName)
        stackview.addSubview(password)
        stackview.addSubview(phonenumber)
        stackview.addSubview(register)
        stackview.addSubview(address)
        stackview.addSubview(email)
    }
    func setLayout(){
        container.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        container.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        stackview.topAnchor.constraint(equalTo: container.topAnchor, constant: 50).isActive = true
        stackview.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        stackview.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20).isActive = true
        stackview.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20).isActive = true
        
        logoImage.centerXAnchor.constraint(equalTo: stackview.centerXAnchor, constant: 0).isActive = true
        logoImage.topAnchor.constraint(equalTo: stackview.topAnchor, constant: 10).isActive = true
        
        userName.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 20).isActive = true
        userName.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        userName.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        userName.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        password.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 15).isActive = true
        password.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        password.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        password.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        phonenumber.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 15).isActive = true
        phonenumber.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        phonenumber.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        phonenumber.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        address.topAnchor.constraint(equalTo: phonenumber.bottomAnchor, constant: 15).isActive = true
        address.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        address.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        address.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        email.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 15).isActive = true
        email.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        email.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        email.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        register.topAnchor.constraint(equalTo:email.bottomAnchor, constant: 15).isActive = true
        register.widthAnchor.constraint(equalToConstant: 120).isActive = true
        register.heightAnchor.constraint(equalTo: email.heightAnchor, constant: 0).isActive = true
        register.centerXAnchor.constraint(equalTo: stackview.centerXAnchor, constant: 0).isActive = true
    }
    
    @objc func registerTap(){
        if self.userName.text! == "" {
            let alert = UIAlertController(title: "Thông Báo", message: "Vui Lòng Điền Họ Và Tên", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Quay Lại", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return;
        }
        if self.password.text! == "" {
            let alert = UIAlertController(title: "Thông Báo", message: "Vui Lòng Điền Mật Khẩu", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Quay Lại", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return;
        }
        if self.phonenumber.text! == "" {
            let alert = UIAlertController(title: "Thông Báo", message: "Vui Lòng Điền Số Điện THoại", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Quay Lại", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return;
        }
        if self.address.text! == "" {
            let alert = UIAlertController(title: "Thông Báo", message: "Vui Lòng Điền Địa Chỉ", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Quay Lại", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return;
        }
        if self.email.text! == "" {
            let alert = UIAlertController(title: "Thông Báo", message: "Vui Lòng Điền Email", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Quay Lại", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return;
        }
        let name = self.userName.text!
        let passwordtext = self.password.text!
        let phoneNumber = self.phonenumber.text!
        let address = self.address.text!
        let email = self.email.text!
        
        registerBTN(name, passwordtext, phoneNumber,address,email)
    }
    func registerBTN(_ Name: String,_ Password: String,_ PhoneNumber: String,_ Address: String, _ Email: String) {
        let urlregister = "http://report.bekhoe.vn/api/accounts/Register"
        let header : HTTPHeaders = ["Content-Type":"application/x-www-form-urlencoded"]
        let par = ["Name" : Name,"Password": Password, "PhoneNumber": PhoneNumber, "Address": Address, "Email" : Email]
        AF.request(urlregister, method: .post, parameters: par, encoding: URLEncoding.httpBody, headers: header).responseJSON{
            response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                print(json)
                let code = json["code"].intValue
                let profileVC = Profile()
                UserDefaults.standard.removeObject(forKey: "token")
                print("đã remove token trước đó \(UserDefaults.standard.removeObject(forKey: "token"))")
                if code == 0{
                    let data = User(json: json["data"])
                    if let token = (data?.token!) {
                        UserDefaults.standard.setValue(token, forKey: "token")
                        UserDefaults.standard.setValue(self.password.text, forKey: "Password")
                        print(UserDefaults.standard.setValue(self.password.text, forKey: "Password"))
                        print("token regisster.   ----   \(token)")
                        let alert = UIAlertController(title: "Thông Báo", message: "Success", preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Quay Lại", style: UIAlertAction.Style.default, handler: nil))
                        alert.addAction(UIAlertAction(title: "Chuyển đến ", style: .default, handler: { (UIAlertAction) in
                            if !token.isEmpty{
                                let navigationController = UINavigationController.init(rootViewController: profileVC)
                                navigationController.modalPresentationStyle = .fullScreen
                                self.present(navigationController, animated: true, completion: nil)
                            }
                        }))
                        self.present(alert, animated: true, completion: nil)
                    }
                }else{
                    let message = json["message"].stringValue
                    if code == 500{
                        let alert = UIAlertController(title: "Thông Báo", message: message, preferredStyle: UIAlertController.Style.alert)
                        alert.addAction(UIAlertAction(title: "Quay Lại", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                    print(message)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}

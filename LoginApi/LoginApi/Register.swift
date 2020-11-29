//
//  Register.swift
//  LoginApi
//
//  Created by namit on 29/11/2020.
//

import UIKit

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
        stackview.backgroundColor = UIColor.blue.withAlphaComponent(0.2)
        stackview.layer.cornerRadius = 20
        stackview.layer.masksToBounds = false
        stackview.layer.shadowColor = UIColor.yellow.cgColor
        stackview.layer.shadowOffset = .zero
        stackview.layer.shadowRadius = 30
        stackview.layer.shadowPath = UIBezierPath(rect: stackview.bounds).cgPath
        return stackview
    }()
    
    let logoImage: UIImageView = {
        let imageLogo = UIImageView()
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        imageLogo.image = UIImage(named: "logo")
        imageLogo.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        return imageLogo
    }()
    
    let userName: UITextField = {
        let userName = UITextField()
        userName.translatesAutoresizingMaskIntoConstraints = false
        userName.backgroundColor = UIColor.systemPink.withAlphaComponent(0.5)
        userName.layer.cornerRadius = 5
        userName.textColor = .white
        userName.clearsOnBeginEditing = true
        userName.attributedPlaceholder = NSAttributedString(string: "Họ Và Tên", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return userName
    }()
    let password: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.backgroundColor = UIColor.systemPink.withAlphaComponent(0.5)
        password.layer.cornerRadius = 5
        password.textColor = .white
        password.clearsOnBeginEditing = true
        password.attributedPlaceholder = NSAttributedString(string: "Mật Khẩu", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return password
    }()
    let phonenumber: UITextField = {
        let phonenumber = UITextField()
        phonenumber.translatesAutoresizingMaskIntoConstraints = false
        phonenumber.backgroundColor = UIColor.systemPink.withAlphaComponent(0.5)
        phonenumber.layer.cornerRadius = 5
        phonenumber.textColor = .white
        phonenumber.clearsOnBeginEditing = true
        phonenumber.attributedPlaceholder = NSAttributedString(string: "Số Điện Thoại", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        return phonenumber
    }()
    let register: UIButton = {
        let register = UIButton()
        register.translatesAutoresizingMaskIntoConstraints = false
        register.setTitle("Gửi Đăng Kí", for: .normal)
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
    }
    func setLayout(){
        container.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        container.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        stackview.topAnchor.constraint(equalTo: container.topAnchor, constant: 50).isActive = true
        stackview.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        stackview.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20).isActive = true
        stackview.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -50).isActive = true
        
        logoImage.centerXAnchor.constraint(equalTo: stackview.centerXAnchor, constant: 0).isActive = true
        logoImage.centerYAnchor.constraint(equalTo: stackview.centerYAnchor, constant: -200).isActive = true
        
        userName.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 50).isActive = true
        userName.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        userName.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        userName.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        password.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 30).isActive = true
        password.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        password.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        password.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        phonenumber.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 30).isActive = true
        phonenumber.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        phonenumber.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        phonenumber.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        register.topAnchor.constraint(equalTo:phonenumber.bottomAnchor, constant: 30).isActive = true
        register.widthAnchor.constraint(equalTo: register.widthAnchor,constant: 0).isActive = true
        register.heightAnchor.constraint(equalTo: register.heightAnchor, constant: 0).isActive = true
//        register.bottomAnchor.constraint(equalTo: stackview.bottomAnchor, constant: 0).isActive = true
        register.centerXAnchor.constraint(equalTo: stackview.centerXAnchor, constant: 0).isActive = true
        
        
        
        
    }
  
}

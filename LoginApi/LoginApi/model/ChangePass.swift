//
//  ChangePass.swift
//  LoginApi
//
//  Created by namit on 02/12/2020.
//

import UIKit
import Alamofire
import SwiftyJSON
import TextFieldEffects
import SkyFloatingLabelTextField

class ChangePass: UIViewController {
    deinit {
        print("Huỷ ChangePassViewController")
    }
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
        //        stackview.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        stackview.layer.cornerRadius = 20
        stackview.clipsToBounds = true
        return stackview
    }()
    let tieuDe: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.text = "Change Password"
        title.textAlignment = .center
        title.backgroundColor = UIColor(red:0.220, green:0.643, blue:0.973, alpha: 1.000)
        return title
    }()
    
    let oldPass: UILabel = {
        let dangnhap = UILabel()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
        dangnhap.text = "Old Password"
        dangnhap.font = UIFont.italicSystemFont(ofSize: 17)
        dangnhap.clipsToBounds = true
        return dangnhap
    }()
    let newPass: UILabel = {
        let dangnhap = UILabel()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
        dangnhap.text = "New Password"
        dangnhap.font = UIFont.italicSystemFont(ofSize: 17)
        dangnhap.clipsToBounds = true
        return dangnhap
    }()
    let reNewPass: UILabel = {
        let dangnhap = UILabel()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
        dangnhap.text = "Re-New Password"
        dangnhap.font = UIFont.italicSystemFont(ofSize: 17)
        dangnhap.clipsToBounds = true
        return dangnhap
    }()
    
    var titleOldPass: UITextField = {
        let titelname = SkyFloatingLabelTextField()
        titelname.translatesAutoresizingMaskIntoConstraints = false
        titelname.text = ""
        titelname.clipsToBounds = true
        titelname.selectedLineColor = UIColor.green.withAlphaComponent(0.8)
        titelname.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: titelname.frame.height))
        titelname.leftViewMode = .always
        titelname.isSecureTextEntry = true
        titelname.clearsOnBeginEditing = true
        return titelname
    }()
    var titleNewPass: UITextField = {
        let titelname = SkyFloatingLabelTextField()
        titelname.translatesAutoresizingMaskIntoConstraints = false
        titelname.text = ""
        titelname.clipsToBounds = true
        titelname.selectedLineColor = UIColor.green.withAlphaComponent(0.8)
        titelname.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: titelname.frame.height))
        titelname.leftViewMode = .always
        titelname.layer.cornerRadius = 15
        titelname.isSecureTextEntry = true
        titelname.clearsOnBeginEditing = true
        return titelname
    }()
    var titleReNewPass: UITextField = {
        let titelname = SkyFloatingLabelTextField()
        titelname.translatesAutoresizingMaskIntoConstraints = false
        titelname.text = ""
        titelname.clipsToBounds = true
        titelname.selectedLineColor = UIColor.green.withAlphaComponent(0.8)
        titelname.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: titelname.frame.height))
        titelname.leftViewMode = .always
        titelname.isSecureTextEntry = true
        titelname.clearsOnBeginEditing = true
        return titelname
    }()
    let changePasword: UIButton = {
        let register = UIButton()
        register.translatesAutoresizingMaskIntoConstraints = false
        register.setTitle("Change Pasword", for: .normal)
        register.backgroundColor = UIColor(red:0.733, green:0.733, blue:0.733, alpha: 1.000)
        register.layer.cornerRadius = 15
        register.titleLabel?.font = UIFont.init(name: "Arial", size: 15)
        return register
    }()
    let bottomTieuDe: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.backgroundColor = UIColor(red:0.220, green:0.643, blue:0.973, alpha: 1.000)
        return title
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white.withAlphaComponent(1)
        container.backgroundColor = UIColor.white.withAlphaComponent(0)
        stackview.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)
        addSub()
        setLayout()
        navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController!.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        container.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animationOut)))
        //        shadowStack()
        changePasword.addTarget(self, action: #selector(killchangePass), for: .touchUpInside)
    }
    func addSub(){
        view.addSubview(container)
        view.addSubview(stackview)
        stackview.addSubview(tieuDe)
        stackview.addSubview(oldPass)
        stackview.addSubview(newPass)
        stackview.addSubview(reNewPass)
        stackview.addSubview(titleOldPass)
        stackview.addSubview(titleNewPass)
        stackview.addSubview(titleReNewPass)
        stackview.addSubview(changePasword)
        stackview.addSubview(bottomTieuDe)
        
    }
    func setLayout(){
        container.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        container.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        stackview.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        stackview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        stackview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        stackview.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200).isActive = true
        
        tieuDe.centerXAnchor.constraint(equalTo: stackview.centerXAnchor, constant: 0).isActive = true
        tieuDe.topAnchor.constraint(equalTo: stackview.topAnchor, constant: 0).isActive = true
        tieuDe.widthAnchor.constraint(equalTo: stackview.widthAnchor, constant: 0).isActive = true
        tieuDe.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        oldPass.topAnchor.constraint(equalTo: tieuDe.bottomAnchor, constant:  40).isActive = true
        oldPass.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        oldPass.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        titleOldPass.topAnchor.constraint(equalTo: oldPass.bottomAnchor, constant: -10).isActive = true
        titleOldPass.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        titleOldPass.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        newPass.topAnchor.constraint(equalTo: oldPass.bottomAnchor, constant: 40).isActive = true
        newPass.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        newPass.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        titleNewPass.topAnchor.constraint(equalTo: newPass.bottomAnchor, constant:  -10).isActive = true
        titleNewPass.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        titleNewPass.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        reNewPass.topAnchor.constraint(equalTo: newPass.bottomAnchor, constant:  40).isActive = true
        reNewPass.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        reNewPass.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        titleReNewPass.topAnchor.constraint(equalTo: reNewPass.bottomAnchor, constant: -10).isActive = true
        titleReNewPass.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        titleReNewPass.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        changePasword.topAnchor.constraint(equalTo: titleReNewPass.bottomAnchor, constant: 40).isActive = true
        changePasword.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        changePasword.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        changePasword.heightAnchor.constraint(equalTo: titleReNewPass.heightAnchor, constant: 0).isActive = true
        
        bottomTieuDe.centerXAnchor.constraint(equalTo: stackview.centerXAnchor, constant: 0).isActive = true
        bottomTieuDe.bottomAnchor.constraint(equalTo: stackview.bottomAnchor, constant: 0).isActive = true
        bottomTieuDe.widthAnchor.constraint(equalTo: stackview.widthAnchor, constant: 0).isActive = true
        bottomTieuDe.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
//    MARK: -- Animation poup cho changepass tự thoát
    @objc func animationOut(){
        UIView.animate(withDuration: 0.3){
            self.container.transform = CGAffineTransform(translationX: 0, y: -self.view.frame.height)
            self.dismiss(animated: true, completion: nil)
        }
    }
    @objc func killchangePass(){
        let TitleOldPass = titleOldPass.text!
        let TitleNewPass = titleNewPass.text!
        let TitleReNewPass = titleReNewPass.text!
        if titleOldPass.text! == ""{
            let alert = UIAlertController(title: "Thông Báo", message: "Vui Lòng Điền Mật Khẩu Cũ", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Quay Lại", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        if titleNewPass.text! == ""{
            let alert = UIAlertController(title: "Thông Báo", message: "Vui Lòng Điền Mật Khẩu Mới", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Quay Lại", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        if titleReNewPass.text! == ""{
            let alert = UIAlertController(title: "Thông Báo", message: "Vui Lòng Nhập Lại Mật Khẩu Mới", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Quay Lại", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        if TitleNewPass != TitleReNewPass{
            let alert = UIAlertController(title: "Thông Báo", message: "Mật Khẩu Mới Không Giống Nhau", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Quay Lại", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        thayDoiPass(TitleNewPass, TitleOldPass)
        print("da nhan thay doi mk")
    }
//    MARK: -- skill thay đổi mật khẩu
    func thayDoiPass(_ NewPassword: String,_ OldPassword: String){
        let urlChangePass = "http://report.bekhoe.vn/api/accounts/changePassword"
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        let par = ["NewPassword": NewPassword, "OldPassword" : OldPassword]
        let header: HTTPHeaders = ["Authorization" : "Bearer \(token)",
                                   "Content-Type" : "application/x-www-form-urlencoded"]
        AF.request(urlChangePass, method: .post, parameters: par, encoding: URLEncoding.httpBody, headers: header).responseJSON{
            response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                let code = json["code"].intValue
                let profileVC = Profile()
                print(json)
                if json["data"].stringValue == "true"{
                    let alert = UIAlertController(title: "Thông Báo", message: "Success", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Chuyển đến Profile ", style: .default, handler: { (UIAlertAction) in
                        if code == 0{
                            let navigationController = UINavigationController.init(rootViewController: profileVC)
                            navigationController.modalPresentationStyle = .fullScreen
                            self.present(navigationController, animated: true, completion: nil)
                        }
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
                if code == 500{
                    let message = json["message"].stringValue
                    let alert = UIAlertController(title: "Thông Báo", message: message, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Quay Lại", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
}




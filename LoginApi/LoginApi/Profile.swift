//
//  Profile.swift
//  LoginApi
//
//  Created by namit on 27/11/2020.
//

import UIKit
import Alamofire
import SwiftyJSON
import SkyFloatingLabelTextField


class Profile: UIViewController {
//    MARK: -- Tạo biến nhận data đó
    var userName = ""
    var isFirst: Bool = true
    deinit {
        print("Huỷ ProfileViewController")
    }
    let container: UIView = {
        let containew = UIView()
        containew.translatesAutoresizingMaskIntoConstraints = false
        containew.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        return containew
    }()
    let stackview: UIStackView = {
       let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.backgroundColor = .white
        stackview.layer.cornerRadius = 20
       return stackview
    }()
    let logoVinHome: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        logo.image = UIImage(named:"logo")
        return logo
    }()
    let tendangnhapLabel: UILabel = {
        let dangnhap = UILabel()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
        dangnhap.text = "Họ Và Tên"
        dangnhap.font = UIFont.italicSystemFont(ofSize: 17)
        return dangnhap
    }()
    let ngaySinh: UILabel = {
        let dangnhap = UILabel()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
        dangnhap.text = "Ngày sinh"
        dangnhap.font = UIFont.italicSystemFont(ofSize: 17)
        return dangnhap
    }()
    let diaChi: UILabel = {
        let dangnhap = UILabel()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
        dangnhap.text = "Địa Chỉ"
        dangnhap.font = UIFont.italicSystemFont(ofSize: 17)
        return dangnhap
    }()
    let sodienThoai: UILabel = {
        let dangnhap = UILabel()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
        dangnhap.text = "Số Điện Thoại"
        dangnhap.font = UIFont.italicSystemFont(ofSize: 17)
        return dangnhap
    }()
    let emailLabel: UILabel = {
        let dangnhap = UILabel()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
        dangnhap.text = "Email"
        dangnhap.font = UIFont.italicSystemFont(ofSize: 17)
        return dangnhap
    }()
    
    var titleName: UITextField = {
        let titelname = SkyFloatingLabelTextField()
        titelname.translatesAutoresizingMaskIntoConstraints = false
        titelname.text = ""
        titelname.clipsToBounds = true
        titelname.selectedLineColor = UIColor.green.withAlphaComponent(0.8)
        titelname.isUserInteractionEnabled = false
        titelname.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: titelname.frame.height))
        titelname.leftViewMode = .always
        titelname.layer.cornerRadius = 15
        return titelname
    }()
    
    var titleAge: UITextField = {
        let titelname = SkyFloatingLabelTextField()
        titelname.translatesAutoresizingMaskIntoConstraints = false
        titelname.text = "Chưa có thông tin"
        titelname.clipsToBounds = true
        titelname.selectedLineColor = UIColor.green.withAlphaComponent(0.8)
//        titelname.isUserInteractionEnabled = false
        titelname.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: titelname.frame.height))
        titelname.leftViewMode = .always
        titelname.layer.cornerRadius = 15
        return titelname
    }()
    var titleAddress: UITextField = {
        let titelname = SkyFloatingLabelTextField()
        titelname.translatesAutoresizingMaskIntoConstraints = false
        titelname.text = ""
        titelname.clipsToBounds = true
        titelname.selectedLineColor = UIColor.green.withAlphaComponent(0.8)
        titelname.isUserInteractionEnabled = false
        titelname.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: titelname.frame.height))
        titelname.leftViewMode = .always
        titelname.layer.cornerRadius = 15
        return titelname
    }()
    var titlePhone: UITextField = {
        let titelname = SkyFloatingLabelTextField()
        titelname.translatesAutoresizingMaskIntoConstraints = false
        titelname.text = ""
        titelname.clipsToBounds = true
        titelname.selectedLineColor = UIColor.green.withAlphaComponent(0.8)
        titelname.isUserInteractionEnabled = false
        titelname.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: titelname.frame.height))
        titelname.leftViewMode = .always
        titelname.layer.cornerRadius = 15
        return titelname
    }()
    var titleEmail: UITextField = {
        let titelname = SkyFloatingLabelTextField()
        titelname.translatesAutoresizingMaskIntoConstraints = false
        titelname.text = ""
        titelname.clipsToBounds = true
        titelname.selectedLineColor = UIColor.green.withAlphaComponent(0.8)
        titelname.isUserInteractionEnabled = false
        titelname.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: titelname.frame.height))
        titelname.leftViewMode = .always
        titelname.layer.cornerRadius = 15
        return titelname
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.lightGray
        let editButton = UIBarButtonItem(title: "EDIT", style: .done, target: self, action: #selector(edit))
        navigationItem.rightBarButtonItem = editButton
        let signOutButton = UIBarButtonItem(image: UIImage.init(systemName: "location"), style: .done, target: self, action: #selector(signOut))
        navigationItem.leftBarButtonItem = signOutButton
        DispatchQueue.main.async {
                    self.getProfile()
                }
        addSub()
        setLayout()
        navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController!.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true

    }
    @objc func edit(){
       
    print("go edit")
    }
    @objc func signOut(){
        
        UserDefaults.standard.removeObject(forKey: "token")
        if isFirst {
            // Nếu chưa có màn login trước đó, thì khởi tạo và show lên màn login
            let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let loginVC = mainStoryboard.instantiateViewController(identifier: "ViewController") as! ViewController
            loginVC.modalPresentationStyle = .fullScreen
            self.present(loginVC, animated: true, completion: nil)
        } else {
            // Nếu đã có màn login trước đó, thì dismiss về màn login
            self.dismiss(animated: true, completion: nil)
        }
    print("log out")
    
    }
    func getProfile(){
        let url = "http://report.bekhoe.vn/api/accounts/profile"
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        let header: HTTPHeaders = [.authorization(bearerToken: token)]
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { [self]
            response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                //không chắc có giá trị hay ko thì if let hoặc guard let hoặc ?? để xử lý nil
                if let data = User(json: json["data"]), let name = data.name{
                    self.userName = name
                    navigationItem.title = userName
                    self.titleName.text = userName
                    self.titleAddress.text = data.adress
                    self.titlePhone.text = data.phoneNumber
                    self.titleEmail.text = data.email
                    
                }
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    func addSub(){
        view.addSubview(container)
        container.addSubview(stackview)
        stackview.addSubview(logoVinHome)
        stackview.addSubview(tendangnhapLabel)
        stackview.addSubview(ngaySinh)
        stackview.addSubview(diaChi)
        stackview.addSubview(sodienThoai)
        stackview.addSubview(emailLabel)
        stackview.addSubview(titleName)
        stackview.addSubview(titleAge)
        stackview.addSubview(titleAddress)
        stackview.addSubview(titlePhone)
        stackview.addSubview(titleEmail)

    }
    func setLayout(){
        container.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        container.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        stackview.topAnchor.constraint(equalTo: container.topAnchor, constant:  100).isActive = true
        stackview.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        stackview.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20).isActive = true
        stackview.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -50).isActive = true
        
        logoVinHome.centerXAnchor.constraint(equalTo: stackview.centerXAnchor, constant: 0).isActive = true
        logoVinHome.centerYAnchor.constraint(equalTo: stackview.centerYAnchor, constant: -250).isActive = true

        tendangnhapLabel.topAnchor.constraint(equalTo: logoVinHome.bottomAnchor, constant:  50).isActive = true
        tendangnhapLabel.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 30).isActive = true
        tendangnhapLabel.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        titleName.topAnchor.constraint(equalTo: tendangnhapLabel.bottomAnchor, constant: -5).isActive = true
        titleName.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        titleName.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
//        titleName.topAnchor.constraint(equalTo: tendangnhapLabel.bottomAnchor, constant: 10).isActive = true
        
        ngaySinh.topAnchor.constraint(equalTo: tendangnhapLabel.bottomAnchor, constant:  50).isActive = true
        ngaySinh.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 30).isActive = true
        ngaySinh.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        titleAge.topAnchor.constraint(equalTo: ngaySinh.bottomAnchor, constant: -5).isActive = true
        titleAge.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        titleAge.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        diaChi.topAnchor.constraint(equalTo: ngaySinh.bottomAnchor, constant:  50).isActive = true
        diaChi.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 30).isActive = true
        diaChi.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        titleAddress.topAnchor.constraint(equalTo: diaChi.bottomAnchor, constant: -5).isActive = true
        titleAddress.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        titleAddress.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        sodienThoai.topAnchor.constraint(equalTo: diaChi.bottomAnchor, constant:  50).isActive = true
        sodienThoai.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 30).isActive = true
        sodienThoai.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        titlePhone.topAnchor.constraint(equalTo: sodienThoai.bottomAnchor, constant: -5).isActive = true
        titlePhone.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        titlePhone.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        emailLabel.topAnchor.constraint(equalTo: sodienThoai.bottomAnchor, constant:  50).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 30).isActive = true
        emailLabel.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        titleEmail.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: -5).isActive = true
        titleEmail.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        titleEmail.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
    }
}

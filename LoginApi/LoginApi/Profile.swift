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
import SideMenuSwift
import Kingfisher

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
        containew.clipsToBounds = true
        return containew
    }()
    let stackview: UIStackView = {
       let stackview = UIStackView()
        stackview.translatesAutoresizingMaskIntoConstraints = false
        stackview.backgroundColor = .white
        stackview.layer.cornerRadius = 20
        stackview.clipsToBounds = true
       return stackview
    }()
    let logoVinHome: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        logo.image = UIImage(named:"logo")
        logo.clipsToBounds = true
        return logo
    }()
    let tendangnhapLabel: UILabel = {
        let dangnhap = UILabel()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
        dangnhap.text = "Họ Và Tên"
        dangnhap.font = UIFont.italicSystemFont(ofSize: 17)
        dangnhap.clipsToBounds = true
        return dangnhap
    }()
    let ngaySinh: UILabel = {
        let dangnhap = UILabel()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
        dangnhap.text = "Ngày sinh"
        dangnhap.font = UIFont.italicSystemFont(ofSize: 17)
        dangnhap.clipsToBounds = true
        return dangnhap
    }()
    let diaChi: UILabel = {
        let dangnhap = UILabel()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
        dangnhap.text = "Địa Chỉ"
        dangnhap.font = UIFont.italicSystemFont(ofSize: 17)
        dangnhap.clipsToBounds = true
        return dangnhap
    }()
    let sodienThoai: UILabel = {
        let dangnhap = UILabel()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
        dangnhap.text = "Số Điện Thoại"
        dangnhap.font = UIFont.italicSystemFont(ofSize: 17)
        dangnhap.clipsToBounds = true
        return dangnhap
    }()
    let emailLabel: UILabel = {
        let dangnhap = UILabel()
        dangnhap.translatesAutoresizingMaskIntoConstraints = false
        dangnhap.text = "Email"
        dangnhap.font = UIFont.italicSystemFont(ofSize: 17)
        dangnhap.clipsToBounds = true
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
         return titelname
    }()
    var titleAge: UITextField = {
        let titelname = SkyFloatingLabelTextField()
        titelname.translatesAutoresizingMaskIntoConstraints = false
        titelname.text = ""
        titelname.clipsToBounds = true
        titelname.selectedLineColor = UIColor.green.withAlphaComponent(0.8)
        titelname.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: titelname.frame.height))
        titelname.leftViewMode = .always
        titelname.isUserInteractionEnabled = false
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
        return titelname
    }()
    let updateBtn: UIButton = {
        let updateBtn = UIButton()
        updateBtn.translatesAutoresizingMaskIntoConstraints = false
        updateBtn.setTitle("Cập Nhật Thông Tin", for: .normal)
        updateBtn.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        updateBtn.setTitleColor(.black, for: .normal)
        updateBtn.layer.cornerRadius = 10
        return updateBtn
    }()
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.lightGray
        let editButton = UIBarButtonItem(image: UIImage.init(systemName: "slider.horizontal.3"), style: .done, target: self, action: #selector(edit))
        navigationItem.setRightBarButton(editButton, animated: false)
        let signOutButton = UIBarButtonItem(image: UIImage.init(systemName: "power"), style: .done, target: self, action: #selector(signOut))
        navigationItem.leftBarButtonItem = signOutButton
        
        DispatchQueue.main.async {
                    self.getProfile()
   
                }

        addSub()
        setLayout()
        navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController!.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
//        MARK: -- lắng nghe thay đổi
        self.updateBtn.isEnabled = false //khoá tương tác người dùng
        self.updateBtn.isHidden = true  //ẩn nút khi chưa cần dùng đến
//        self.updateBtn.addTarget(self, action: #selector(updateAge), for: .touchUpInside)
//        titleAge.addTarget(self, action: #selector(Profile.listenEdit(_:)), for: .editingChanged)
//        titleAddress.addTarget(self, action: #selector(Profile.listenEdit(_:)), for: .editingChanged)
// Kết thúc lắng nghe
        
        
    }
    @objc func edit(){
        let editVC = Edit()
        let navigationController = UINavigationController.init(rootViewController: editVC)
        navigationController.modalPresentationStyle = .fullScreen
        self.present(navigationController, animated: true, completion: nil)
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
                    if data.dateOfBirth == "" {
                        self.titleAge.text = "Chưa có thông tin"
                    }else {
                        self.titleAge.text = data.dateOfBirth
                    }
                    if data.avatar == "" {
                        self.logoVinHome.image = UIImage(named: "logo")
                    }else {
                        let api = "http://report.bekhoe.vn/api/accounts/profile" + data.avatar!
                        self.logoVinHome.kf.setImage(with: URL(string: api))
                        print(api)
                    }
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
        stackview.addSubview(updateBtn)

    }
    func setLayout(){
        container.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        container.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        stackview.topAnchor.constraint(equalTo: container.topAnchor, constant:  84).isActive = true
        stackview.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        stackview.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20).isActive = true
        stackview.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20).isActive = true
        
        logoVinHome.centerXAnchor.constraint(equalTo: stackview.centerXAnchor, constant: 0).isActive = true
        logoVinHome.topAnchor.constraint(equalTo: stackview.topAnchor, constant: 10).isActive = true

        tendangnhapLabel.topAnchor.constraint(equalTo: logoVinHome.bottomAnchor, constant:  40).isActive = true
        tendangnhapLabel.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 30).isActive = true
        tendangnhapLabel.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        titleName.topAnchor.constraint(equalTo: tendangnhapLabel.bottomAnchor, constant: -15).isActive = true
        titleName.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        titleName.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        ngaySinh.topAnchor.constraint(equalTo: tendangnhapLabel.bottomAnchor, constant:  40).isActive = true
        ngaySinh.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 30).isActive = true
        ngaySinh.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        titleAge.topAnchor.constraint(equalTo: ngaySinh.bottomAnchor, constant: -15).isActive = true
        titleAge.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        titleAge.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        diaChi.topAnchor.constraint(equalTo: ngaySinh.bottomAnchor, constant:  40).isActive = true
        diaChi.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 30).isActive = true
        diaChi.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        titleAddress.topAnchor.constraint(equalTo: diaChi.bottomAnchor, constant: -15).isActive = true
        titleAddress.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        titleAddress.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        sodienThoai.topAnchor.constraint(equalTo: diaChi.bottomAnchor, constant:  40).isActive = true
        sodienThoai.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 30).isActive = true
        sodienThoai.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        titlePhone.topAnchor.constraint(equalTo: sodienThoai.bottomAnchor, constant: -15).isActive = true
        titlePhone.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        titlePhone.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        emailLabel.topAnchor.constraint(equalTo: sodienThoai.bottomAnchor, constant:  40).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 30).isActive = true
        emailLabel.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        titleEmail.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: -15).isActive = true
        titleEmail.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        titleEmail.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        updateBtn.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 40).isActive = true
        updateBtn.centerXAnchor.constraint(equalTo: stackview.centerXAnchor, constant: 0).isActive = true
        updateBtn.widthAnchor.constraint(equalTo: updateBtn.widthAnchor, constant: 0).isActive = true
        updateBtn.heightAnchor.constraint(equalTo:updateBtn.heightAnchor, constant: 0).isActive = true
        
    }
//    MARK: -- Cập nhật thông tin profile
//    @objc func updateAge(){
//        let dayofbirth = self.titleAge.text!
//        let url = "http://report.bekhoe.vn/api/accounts/update"
//        let token = UserDefaults.standard.string(forKey: "token") ?? ""
//        let header: HTTPHeaders = ["Authorization" : "Bearer \(token)",
//            "Content-Type" : "application/x-www-form-urlencoded"]
//        let par = ["dateOfBirth" : dayofbirth, "address" : self.titleAddress.text!]
//        print(par)
//        print(token)
//        AF.request(url, method: .post,parameters: par, encoding: URLEncoding.httpBody, headers: header).responseJSON{
//            response in
//            print(response)
//            switch response.result {
//            case .success(let value):
//                let json = JSON(value)
//                print(json)
//            case .failure(let err):
//                print(err.localizedDescription)
//            }
//        }
//
//    }
//    MARK: -- phương thức lắng nghe
//    @objc func listenEdit(_ titleAge: UITextField){
//        if titleAge.text == "" {
//            updateBtn.isEnabled = false
//            updateBtn.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
//            updateBtn.setTitle("Cập Nhật Thông Tin", for: .normal)
//        }else {
//            updateBtn.isEnabled = true
//            updateBtn.backgroundColor = UIColor.lightGray
//            updateBtn.setTitle("Được quyền cập nhật", for: .normal)
//        }
//    }

}


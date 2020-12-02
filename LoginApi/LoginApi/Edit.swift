//
//  Edit.swift
//  LoginApi
//
//  Created by namit on 01/12/2020.
//

import UIKit
import TextFieldEffects
import Alamofire
import SwiftyJSON
import Photos

class Edit: UIViewController, UIPopoverPresentationControllerDelegate {
    deinit {
        print("Huỷ EditViewController")
    }

    var imagePicker: UIImagePickerController!
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
    var logoImage: UIImageView = {
        let imageLogo = UIImageView()
        imageLogo.translatesAutoresizingMaskIntoConstraints = false
        imageLogo.image = UIImage(named: "add-photo")
        imageLogo.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        imageLogo.contentMode = .scaleAspectFit
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
    let dateOfBirth: TextFieldEffects = {
        let password = KaedeTextField(frame: CGRect(x: 0, y: 0, width: 130, height: 10))
        password.translatesAutoresizingMaskIntoConstraints = false
        password.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        password.layer.cornerRadius = 10
        password.clipsToBounds = true
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: password.frame.height))
        password.leftViewMode = .always
        password.clearsOnBeginEditing = true
        password.foregroundColor = UIColor.gray.withAlphaComponent(0.5)
        password.placeholder = "Ngày Sinh"
        password.placeholderColor = UIColor.white
        return password
    }()
    let gender: TextFieldEffects = {
        let phonenumber = KaedeTextField(frame: CGRect(x: 0, y: 0, width: 130, height: 10))
        phonenumber.translatesAutoresizingMaskIntoConstraints = false
        phonenumber.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        phonenumber.layer.cornerRadius = 10
        phonenumber.clipsToBounds = true
        phonenumber.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: phonenumber.frame.height))
        phonenumber.leftViewMode = .always
        phonenumber.clearsOnBeginEditing = true
        phonenumber.foregroundColor = UIColor.gray.withAlphaComponent(0.5)
        phonenumber.placeholder = "Giới Tính"
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
        phonenumber.autocapitalizationType = .none
        return phonenumber
    }()
    let register: UIButton = {
        let register = UIButton()
        register.translatesAutoresizingMaskIntoConstraints = false
        register.setTitle("Update Profile", for: .normal)
        register.backgroundColor = UIColor(red:0.733, green:0.733, blue:0.733, alpha: 1.000)
        register.layer.cornerRadius = 15
        register.titleLabel?.font = UIFont.init(name: "Arial", size: 15)
        register.isEnabled = false
        return register
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
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        let back = UIBarButtonItem(image: UIImage.init(systemName:"chevron.left"), style: .done, target: self, action: #selector(quayVe))
        navigationItem.leftBarButtonItem = back
        let upload = UIBarButtonItem(image: UIImage.init(systemName: "camera"), style: .done, target: self, action: #selector(uploadAvatar))
        navigationItem.rightBarButtonItem = upload
        title = "EDIT PROFILE"
        addSub()
        setLayout()
        addTarget()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        DispatchQueue.main.async {
            print("****-----******")
            print(self.logoImage)
        }
    }
//    MARK: -- func của các addtarget
    func addTarget(){
        register.addTarget(self, action: #selector(updateProfile), for: .touchUpInside)
        changePasword.addTarget(self, action: #selector(changPass), for: .touchUpInside)
        userName.addTarget(self, action: #selector(listenEdit), for: .editingChanged)
        dateOfBirth.addTarget(self, action: #selector(listenEdit), for: .editingChanged)
        gender.addTarget(self, action: #selector(listenEdit), for: .editingChanged)
        address.addTarget(self, action: #selector(listenEdit), for: .editingChanged)
        email.addTarget(self, action: #selector(listenEdit), for: .editingChanged)
    }
// MARK: -- thoát quay về màn profile
    @objc func quayVe(){
        dismiss(animated: true, completion: nil)
    }
//    MARK: -- thay đổi mật khẩu
    @objc func changPass(sender: UIButton){
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let popupVC = storyboard.instantiateViewController(withIdentifier: "ChangePass") as! ChangePass
//        popupVC.modalPresentationStyle = .popover
//        popupVC.preferredContentSize = CGSize(width: 300, height: 300)
//        let pVC = popupVC.popoverPresentationController
//        pVC?.permittedArrowDirections = .any
//        pVC?.delegate = self
//        pVC?.sourceView = sender
//        pVC?.sourceRect = CGRect(x: 100, y: 100, width: 1, height: 1)
//        present(popupVC, animated: true, completion: nil)
//        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ChangePass") as? ChangePass else { return }
        let changePass = ChangePass()
        
//        changePass.preferredContentSize = CGSize(width: 100, height: 100)
        let navigationController = UINavigationController.init(rootViewController: changePass)
//        navigationController.modalPresentationStyle = .fullScreen
        navigationController.modalPresentationStyle = .overFullScreen
        navigationController.modalTransitionStyle = .crossDissolve
        navigationController.definesPresentationContext = true
        self.present(navigationController, animated: true)
        print("da tap")
    }
// MARK: -- tạo ràng buộc textfield khi có editchange
    @objc func updateProfile(){
        if self.userName.text! == "" {
            let alert = UIAlertController(title: "Thông Báo", message: "Vui Lòng Điền Họ Và Tên", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Quay Lại", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return;
        }
        if self.dateOfBirth.text! == "" {
            let alert = UIAlertController(title: "Thông Báo", message: "Vui Lòng Điền Ngày Sinh", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Quay Lại", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return;
        }
        if self.gender.text! == "" {
            let alert = UIAlertController(title: "Thông Báo", message: "Vui Lòng Điền Giới Tính", preferredStyle: UIAlertController.Style.alert)
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
        let dayofbirth = self.dateOfBirth.text!
        let userName = self.userName.text!
        let gender = self.gender.text!
        let address = self.address.text!
        let email = self.email.text!
//        var avatarImage = logoImage
        updatePro(dayofbirth, userName, gender, address, email)
    }
//    MARK: -- Phương thức update profile gửi bằng Alamofire
    func updatePro(_ Dayofbirth: String,_ UserName: String,_ Gender: String,_ Address: String,_ Email: String){
        let url = "http://report.bekhoe.vn/api/accounts/update"
        let token = UserDefaults.standard.string(forKey: "token") ?? ""
        let header: HTTPHeaders = ["Authorization" : "Bearer \(token)",
                                   "Content-Type" : "application/x-www-form-urlencoded"]
        let par = ["dateOfBirth" : Dayofbirth, "Name" :UserName, "gender" : "true", "address" : Address, "email": Email]
        AF.request(url, method: .post,parameters: par, encoding: URLEncoding.httpBody, headers: header).responseJSON{
            response in
            print(response)
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let code = json["code"].intValue
                let profileVC = Profile()
                if code == 0{
                    let alert = UIAlertController(title: "Thông Báo", message: "Success", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Chuyển đến Profile ", style: .default, handler: { (UIAlertAction) in
                        if json["code"] == 0{
                            let navigationController = UINavigationController.init(rootViewController: profileVC)
                            navigationController.modalPresentationStyle = .fullScreen
                            self.present(navigationController, animated: true, completion: nil)
                        }
                    }))
                    self.present(alert, animated: true, completion: nil)
                }
                print(json)
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
//    MARK: -- lắng nghe thay đổi từ các textfield để mở kháo button update profile
    @objc func listenEdit(_ userName: UITextField, _ dateOfBirth:UITextField,_ gender: UITextField,_ address:UITextField,_ email:UITextField){
        if userName.text == "" || dateOfBirth.text == "" || gender.text == "" || address.text == "" || email.text == ""{
            register.isEnabled = false
            register.backgroundColor = UIColor(red:0.733, green:0.733, blue:0.733, alpha: 1.000)
        }else {
            register.isEnabled = true
            register.backgroundColor = UIColor.darkGray
        }
    }
    func addSub(){
        view.addSubview(container)
        container.addSubview(stackview)
        stackview.addSubview(logoImage)
        stackview.addSubview(userName)
        stackview.addSubview(dateOfBirth)
        stackview.addSubview(gender)
        stackview.addSubview(register)
        stackview.addSubview(address)
        stackview.addSubview(email)
        stackview.addSubview(changePasword)
    }
    func setLayout(){
        container.topAnchor.constraint(equalTo: view.topAnchor, constant: 89).isActive = true
        container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        container.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        stackview.topAnchor.constraint(equalTo: container.topAnchor, constant: 20).isActive = true
        stackview.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20).isActive = true
        stackview.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20).isActive = true
        stackview.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20).isActive = true
        
        logoImage.centerXAnchor.constraint(equalTo: stackview.centerXAnchor, constant: 0).isActive = true
        logoImage.topAnchor.constraint(equalTo: stackview.topAnchor, constant: 10).isActive = true
        logoImage.widthAnchor.constraint(equalToConstant: 240).isActive = true
        logoImage.heightAnchor.constraint(equalTo: logoImage.widthAnchor, constant: 0).isActive = true
        
        userName.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 20).isActive = true
        userName.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        userName.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        userName.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        dateOfBirth.topAnchor.constraint(equalTo: userName.bottomAnchor, constant: 15).isActive = true
        dateOfBirth.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        dateOfBirth.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        dateOfBirth.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        gender.topAnchor.constraint(equalTo: dateOfBirth.bottomAnchor, constant: 15).isActive = true
        gender.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        gender.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        gender.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        address.topAnchor.constraint(equalTo: gender.bottomAnchor, constant: 15).isActive = true
        address.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        address.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        address.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        email.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 15).isActive = true
        email.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
        email.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        email.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        register.topAnchor.constraint(equalTo:email.bottomAnchor, constant: 15).isActive = true
        register.widthAnchor.constraint(equalToConstant: 130).isActive = true
        register.heightAnchor.constraint(equalTo: email.heightAnchor, constant: 0).isActive = true
        register.trailingAnchor.constraint(equalTo: stackview.trailingAnchor, constant: -20).isActive = true
        
        changePasword.topAnchor.constraint(equalTo:email.bottomAnchor, constant: 15).isActive = true
        changePasword.widthAnchor.constraint(equalToConstant: 130).isActive = true
        changePasword.heightAnchor.constraint(equalTo: email.heightAnchor, constant: 0).isActive = true
        changePasword.leadingAnchor.constraint(equalTo: stackview.leadingAnchor, constant: 20).isActive = true
    }
    @objc func uploadAvatar(){
//        MARK: -- tạo thông báo cho app khi lấy dữ liệu từ camera
        let alert = UIAlertController(title: "VinHome App", message: "Chọn ảnh từ", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Huỷ", style: .cancel, handler: nil)
        let camera = UIAlertAction(title: "Máy ảnh", style: .default, handler: { (_) in
            self.fromCamera()
        })
        let libray = UIAlertAction(title: "Thư viện", style: .default, handler: { (_) in
            self.fromLibrary()
        })
        alert.addAction(camera)
        alert.addAction(libray)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
    }
    func confirm(message: String, viewController: UIViewController?, success: @escaping () -> Void){
        let alert = UIAlertController(title: "VinHome App", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            success()
        }
        alert.addAction(action)
        viewController?.present(alert, animated: true, completion: nil)
    }
    // MARK: - Open setting photos của hệ điều hành
    func setting(){
        let message = "App cần truy cập máy ảnh và thư viện của bạn. Ảnh của bạn sẽ không được chia sẻ khi chưa được phép của bạn."
        confirm(message: message, viewController: self) {
            guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                return
            }
            
            if UIApplication.shared.canOpenURL(settingsUrl) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.openURL(settingsUrl)
                } else {
                    UIApplication.shared.openURL(settingsUrl)
                }
            }
        }
    }
    // MARK: - Lấy ảnh từ thư viện
    private func fromLibrary(){
        func choosePhoto(){
            DispatchQueue.main.async {
                self.imagePicker.allowsEditing = false
                self.imagePicker.sourceType = .photoLibrary
                self.imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
                self.imagePicker.modalPresentationStyle = .popover
                self.present(self.imagePicker, animated: true, completion: nil)
                print("***************")
                print(self.imagePicker)
            }
        }
        
        // khai báo biến để lấy quyền truy cập
        let status = PHPhotoLibrary.authorizationStatus()
        if (status == PHAuthorizationStatus.authorized) {
            // quyền truy cập đã được cấp
            choosePhoto()
        }else if (status == PHAuthorizationStatus.denied) {
            // quyền truy cập bị từ chối
            setting()
        }else if (status == PHAuthorizationStatus.notDetermined) {
            // quyền truy cập chưa được xác nhận
            PHPhotoLibrary.requestAuthorization({ (newStatus) in
                if (newStatus == PHAuthorizationStatus.authorized) {
                    choosePhoto()
                }else {
                    print("Không được cho phép truy cập vào thư viện ảnh")
                    DispatchQueue.main.async {
                        self.setting()
                    }
                }
            })
        }else if (status == PHAuthorizationStatus.restricted) {
            // Truy cập bị hạn chế, thông thường sẽ không xảy ra
            setting()
        }
    }
    // MARK: - Lấy ảnh từ camera
    private func fromCamera(){
        func takePhoto(){
            if UIImagePickerController.isSourceTypeAvailable(.camera){
                DispatchQueue.main.async {
                    self.imagePicker.allowsEditing = false
                    self.imagePicker.sourceType = UIImagePickerController.SourceType.camera
                    self.imagePicker.cameraCaptureMode = .photo
                    self.imagePicker.cameraDevice = .front
                    self.imagePicker.modalPresentationStyle = .fullScreen
                    self.present(self.imagePicker, animated: true,completion: nil)
                }
            }else{
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Thông báo", message: "Không tìm thấy máy ảnh", preferredStyle: .alert)
                    let ok = UIAlertAction(title: "Ok", style: .default, handler: nil)
                    alert.addAction(ok)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        //Camera
        AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
            if response {
                takePhoto()
            } else {
                print("camera denied")
                self.setting()
            }
        }
    }
}
extension Edit: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {
            print("error: \(info)")
            return
        }
        self.logoImage.image = selectedImage
        dismiss(animated: true, completion: nil)
        print("*********-----------************")
        print(self.logoImage)
        
        
    }
    
}

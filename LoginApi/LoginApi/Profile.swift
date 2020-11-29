//
//  Profile.swift
//  LoginApi
//
//  Created by namit on 27/11/2020.
//

import UIKit
import Alamofire
import SwiftyJSON

class Profile: UIViewController {
//    MARK: -- Tạo biến nhận data đó
    var userName = ""
    let token = UserDefaults.standard.string(forKey: "token")
    var isFirst: Bool = true
    deinit {
        print("Huỷ ProfileViewController")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.lightGray
        let editButton = UIBarButtonItem(title: "EDIT", style: .done, target: self, action: #selector(edit))
        navigationItem.rightBarButtonItem = editButton
        let signOutButton = UIBarButtonItem(image: UIImage.init(systemName: "location"), style: .done, target: self, action: #selector(signOut))
        navigationItem.leftBarButtonItem = signOutButton
        getProfile()
        
        print("viewdidload")

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
        let header: HTTPHeaders = [.authorization(bearerToken: token!)]
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON { [self]
            response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                let data = User(json: json["data"])
                self.userName = (data?.name)!
                navigationItem.title = userName
            case .failure(let err):
                print(err.localizedDescription)
            }
            
        }
        
    }

}

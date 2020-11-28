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
    @IBOutlet weak var showProfile: UITextView!
    
//    MARK: -- Tạo biến nhận data đó
    var userName : String!
    var token: String = ""
    var isFirst: Bool = true
    
    deinit {
        print("Huỷ ProfileViewController")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.lightGray
        navigationItem.title = userName
        let editButton = UIBarButtonItem(title: "EDIT", style: .done, target: self, action: #selector(edit))
        navigationItem.rightBarButtonItem = editButton
        let signOutButton = UIBarButtonItem(image: UIImage.init(systemName: "location"), style: .done, target: self, action: #selector(signOut))
        navigationItem.leftBarButtonItem = signOutButton
        getProfile()


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
    func addView(){
        
    }
    func subLayout(){
        
    }
    
    func getProfile(){
//        print("Token profile: \(token)")
        let url = "http://report.bekhoe.vn/api/accounts/profile"
        let header: HTTPHeaders = [.authorization(bearerToken: token)]
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: header).responseJSON {
            response in
            switch response.result{
            case .success(let value):
                let json = JSON(value)
                print(json)
            case .failure(let err):
                print(err.localizedDescription)
            }
            
        }
        
    }

}

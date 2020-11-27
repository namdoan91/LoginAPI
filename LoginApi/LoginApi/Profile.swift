//
//  Profile.swift
//  LoginApi
//
//  Created by namit on 27/11/2020.
//

import UIKit

class Profile: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.lightGray
        navigationItem.title = "Profile"
//        title = "My Profile"
        let editButton = UIBarButtonItem(title: "EDIT", style: .done, target: self, action: #selector(edit))
        navigationItem.rightBarButtonItem = editButton
        
        let signOutButton = UIBarButtonItem(image: UIImage.init(systemName: "location"), style: .done, target: self, action: #selector(signOut))
        navigationItem.leftBarButtonItem = signOutButton
        
    }
    @objc func edit(){
    print("go edit")
    }
    @objc func signOut(){
    print("log out")
        UserDefaults.standard.removeObject(forKey: "token")
        self.dismiss(animated: true, completion: nil)
    }

}

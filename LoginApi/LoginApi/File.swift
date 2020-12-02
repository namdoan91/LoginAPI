//
//  File.swift
//  LoginApi
//
//  Created by namit on 02/12/2020.
//

import UIKit

class Popup : UIView{
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
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSub()
        setLayout()
    }
    func addSub(){
        self.addSubview(container)
        container.addSubview(stackview)
    }
    func setLayout(){
        container.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        container.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        container.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        stackview.topAnchor.constraint(equalTo: container.topAnchor, constant: 200).isActive = true
        stackview.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 40).isActive = true
        stackview.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -40).isActive = true
        stackview.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -200).isActive = true
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

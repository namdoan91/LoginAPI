//
//  Profile.swift
//  LoginApi
//
//  Created by namit on 27/11/2020.
//

import Foundation
import SwiftyJSON
class User{
    var id: Int?
    var createAT:String?
    var createdBy: String?
    var name: String?
    var adress: String?
    var gender: String?
    var phoneNumber: String?
    var email:String?
    var avatar: String?
    var token: String?
    
    required public init?(json : JSON){
        id = json["id"].intValue
        createAT = json["createAT"].stringValue
        createdBy = json["createdBy"].stringValue
        name = json["name"].stringValue
        adress = json["address"].stringValue
        gender = json["gender"].stringValue
        phoneNumber = json["phoneNumber"].stringValue
        email = json["email"].stringValue
        avatar = json["avatar"].stringValue
        token = json["token"].stringValue
    }
}

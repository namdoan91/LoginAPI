//
//  User.swift
//  LoginApi
//
//  Created by namit on 02/12/2020.
//

import Foundation
import SwiftyJSON
class User{
    var id: Int?
    var createdAt: String?
    var createdBy: String?
    var modifiedAt: String?
    var modifiedBy: String?
    var name: String?
    var dateOfBirth: String?
    var address: String?
    var gender: Bool?
    var phoneNumber: String?
    var email: String?
    var avatar: String?
    var token: String?
    
    required public init?(json : JSON){
        id = json["id"].intValue
        createdAt = json["createdAt"].stringValue
        createdBy = json["createdBy"].stringValue
        modifiedAt = json["modifiedAt"].stringValue
        modifiedBy = json["modifiedBy"].stringValue
        name = json["name"].stringValue
        dateOfBirth = json["dateOfBirth"].stringValue
        address = json["address"].stringValue
        gender = json["gender"].boolValue
        phoneNumber = json["phoneNumber"].stringValue
        email = json["email"].stringValue
        avatar = json["avatar"].stringValue
        token = json["token"].stringValue
    }
}


//
//  Upload.swift
//  LoginApi
//
//  Created by namit on 03/12/2020.
//

import Foundation
import SwiftyJSON

class Upload{

    let contentType: String?
    let extensionField: String?
    let name: String?
    let size: String?
    let path: String?

    required public init?(json: JSON) {
        contentType = json["contentType"].stringValue
        extensionField = json["extension"].stringValue
        name = json["name"].stringValue
        size = json["size"].stringValue
        path = json["path"].stringValue
    }

}

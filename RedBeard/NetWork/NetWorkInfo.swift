//
//  NetWorkInfo.swift
//  RedBeard
//
//  Created by 陳冠諭 on 2020/11/13.
//

import Foundation

public struct HTTPMethod: Hashable {
    public static let get = HTTPMethod(rawValue: "GET")
    public static let post = HTTPMethod(rawValue: "POST")
    public static let put = HTTPMethod(rawValue: "PUT")
    public static let delete = HTTPMethod(rawValue: "DELETE")

    public let rawValue: String
}


public struct HTTPStatus:Hashable{
    public let rawValue: Int
}

enum ContentType:String{
    case json = "application/json"
    case formData = "multipart/form-data"
}

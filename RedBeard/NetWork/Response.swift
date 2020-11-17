//
//  Response.swift
//  RedBeard
//
//  Created by 陳冠諭 on 2020/11/13.
//

import Foundation

public struct HTTPResponse{
    public let request:HTTPRequest
    private let response:HTTPURLResponse
    public let data:Data?
    
    public var status:HTTPStatus{
        HTTPStatus(rawValue: response.statusCode)
    }
    
    public var message:String{
        HTTPURLResponse.localizedString(forStatusCode: response.statusCode)
    }
        
    //all header
    public var header:[AnyHashable:Any]{response.allHeaderFields}
}

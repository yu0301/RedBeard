//
//  ProtocolBody.swift
//  RedBeard
//
//  Created by 陳冠諭 on 2020/11/13.
//

import Foundation

public protocol HTTPBody{
    var isEmpty:Bool{get}
    var additionalHeaders:[String:String]{get}
    func encode() throws -> Data
}


//先定義好protocol裡面的值
//確認沒東西的話
extension HTTPBody{
    public var isEmpty:Bool{return false}
    public var additionalHeaders:[String:String] {return [:]}
}


//MARK:- Empty body，前面的HTTPRequest body如果是空的，可以把這個丟進去
public struct EmptyBody:HTTPBody{
    public var isEmpty = true
    
    //?
    public init(){}
    public func encode() throws -> Data {
        Data()
    }
}


//MARK: - Data body
//不需要得到body，但是已經有了Data需要send
public struct DataBody:HTTPBody{
    private let data:Data
    public var isEmpty: Bool{data.isEmpty}
    public var additionalHeaders:[String:String]
    
    public init(_ data:Data,additionalHeaders:[String:String]){
        self.data = data
        self.additionalHeaders = additionalHeaders
    }
    public func encode() throws -> Data {
        data
    }
}

//let otherData: Data = ...
//var request = HTTPRequest()
//request.body = DataBody(otherData)

//MARK:- JSON Body

//public struct JSONBody:HTTPBody{
//    public var isEmpty = false
//    public var additionalHeaders = ["Content-Type","application/json; charset=utf-8"]
//    private let encodee:() throws -> Data
//    
//    
//    public init <T:Encodable>(_ value:T,encoder:JSONEncoder = JSONEncoder()){
//        self.encodee = {try encoder.encode(value)}
//    }
//    public func encode() throws -> Data { return try encodee() }
//    
//}

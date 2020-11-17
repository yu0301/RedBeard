//
//  Error.swift
//  RedBeard
//
//  Created by 陳冠諭 on 2020/11/13.
//

import Foundation

enum NetWorkError:Error{
    case systemError
    case noResponse
    case noData
    
    
    var description:String{
        
        switch self{
        
        case .systemError:
            return "Something is wrong"
        case .noResponse:
            return "No Response"
        case .noData:
            return "No Data"
        }
    }
}

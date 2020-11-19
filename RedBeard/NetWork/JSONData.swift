//
//  JSONData.swift
//  RedBeard
//
//  Created by 陳冠諭 on 2020/11/14.
//

import Foundation
import UIKit
struct GetData:Codable{
    var results:[Results]
}

struct Results : Codable {
    let id : String?
    let type : String?
    let name : String?
    let position : String?
    let expertise : [String]?
    let avatar : String?
    var avatarURL: URL? {
        return URL(string: avatar!)!
    }
    let url:String?
    
}

var fullScreenX = UIScreen.main.bounds.maxX
var fullScreenY = UIScreen.main.bounds.maxY



extension UIImageView{
    func load(url:URL){
        DispatchQueue.main.async { [weak self] in
            if let data = try?Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        //放預設圖
                        self!.image = image
                    }
                }
            }
        }
    }
}


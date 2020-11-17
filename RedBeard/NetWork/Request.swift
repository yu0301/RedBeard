//
//  Re.swift
//  RedBeard
//
//  Created by 陳冠諭 on 2020/11/13.
//

import Foundation

public struct HTTPRequest{
    
    func generateURL(teamName:String,pageNumber:Int) -> URL{
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "us-central1-redso-challenge.cloudfunctions.net"
        urlComponents.path = "/catalog"
        urlComponents.queryItems = [URLQueryItem(name: "team", value: teamName),URLQueryItem(name: "page", value: "\(pageNumber)")]
        return urlComponents.url!
    }
    
    func load<T:Codable>(teamName:String,pageNumber:Int,completion:@escaping (Result<T,NetWorkError>) -> Void){
        let request = generateURL(teamName: teamName, pageNumber: pageNumber)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async{
                guard let data = data else {
                    completion(.failure(.noData))
                    return
                }

                guard let response = response as? HTTPURLResponse else {
                    completion(.failure(.noResponse))
                    return
                }
                
                switch response.statusCode{
                case 200...299:
                    do {
                        let decotedData = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(decotedData))
                    }catch{
                        completion(.failure(.noData))
                    }
                //錯誤處理之後再寫
                default:
                    do {
                        let decotedData = try JSONDecoder().decode(T.self, from: data)
                        completion(.success(decotedData))
                    }catch{
                        completion(.failure(.noData))
                    }
                }
            }
        }
        task.resume()
    }
}




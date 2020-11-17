//
//  Loading.swift
//  RedBeard
//
//  Created by 陳冠諭 on 2020/11/14.
//

import Foundation


//class NetworkManager{
//    
//    //tableview被選到時，將team與page作為參數放進去
//    func load<T:Codable>(request: HTTPRequest, completion: @escaping (Result<T,NetWorkError>) -> Void){
//            URLSession.shared.dataTask(with: request.urlComponents.url!) { (data, response, error) in
//            self.responseHandler(data: data!, response: response! as! HTTPURLResponse, completion: completion)
//        }.resume()
//        
//    }
//    
//    func responseHandler<T:Codable>
//    (data:Data, response:HTTPURLResponse, completion:@escaping (Result<T,NetWorkError>)  -> Void){
//        switch response.statusCode{
//        case 200...299:
//            do {
//                let decotedData = try JSONDecoder().decode(T.self, from: data)
//                completion(.success(decotedData))
//            }catch{
//                completion(.failure(.noData))
//            }
//            
//            //之後再寫
//        default:
//            do {
//                let decotedData = try JSONDecoder().decode(T.self, from: data)
//                completion(.success(decotedData))
//            }catch{
//                completion(.failure(.noData))
//            }
//        }
//    }
//}
//

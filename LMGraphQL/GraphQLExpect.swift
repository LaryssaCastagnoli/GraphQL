//
//  API.swift
//  BritaniaReceitas
//
//  Created by Laryssa Castagnoli on 30/11/18.
//  Copyright © 2018 Solid. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

open class LMResponse {
    required public init(fromJson: JSON) { }
}

public class LMGraphQLExpect<CustomResponse> where CustomResponse: LMResponse {
    public init() {}
    public typealias block = (_ response: CustomResponse?) -> Void
    static public func with(queryType: String,
                            attribute: String? = nil,
                            client: LMClient,
                            variables: Dictionary<String, Any>? = nil,
                            completion: @escaping block){
        let query = QueryLoader(type: queryType, attribute: attribute)
        var body = Dictionary<String, Any>()
        var headers : HTTPHeaders = [:]
        if let token = LMGraphQLTokenBearer.getToken(){
            headers = ["Authorization" : "Bearer \(token)"] //if token
        }
        body["query"] = query.queryString
        
        if variables != nil{
            if client.clientId != nil{
                var variablesWithClient = variables
                variablesWithClient?["clientId"] = client.clientId
                variablesWithClient?["clientSecret"] = client.clientSecret
                body["variables"] = variablesWithClient?.toInput()
            }else{
                body["variables"] = variables?.toInput()
            }
        }
        
        Alamofire.request(client.apiURL,
                          method: .post,
                          parameters: body,
                          encoding: JSONEncoding.default,
                          headers: headers)
            .responseJSON(completionHandler: { (response) in
                switch response.result {
                case .success:
                    let json = JSON(response.result.value as Any)
                    let item = CustomResponse(fromJson: json)
                    completion(item)
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(nil)
                }
            })
    }
}

extension Dictionary{
    func toInput() -> String{
        var input = Dictionary<String, Any>()
        input["input"] = self
        let jsonData = try! JSONSerialization.data(withJSONObject: input, options: .prettyPrinted)
        if let decoded = String(data: jsonData, encoding: .utf8){
            return decoded
        }
        return ""
    }
}

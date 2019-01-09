//
//  Constants.swift
//
//  Created by Laryssa Castagnoli on 01/12/18.
//  Copyright © 2018 Solid. All rights reserved.
//

public protocol Client {
    var clientId: String? {get}
    var clientSecret: String? {get}
    var apiURL: URL {get}
}

open class Private: Client{
    
    public var clientId: String?{
        return nil
    }
    public var clientSecret: String?{
        return nil
    }
    public var apiURL: URL{
        
        return URL(string: "url api private")!
    }
}

public class Public: Client{
    public init() {}
    
    public var Isclient: Bool = true
    public var clientId: String?{
        return Isclient ? "client id" : nil
    }
    public var clientSecret: String?{
        return Isclient ? "client secret" : nil
    }
    public var apiURL: URL{
        return URL(string: "url api public")!
    }
}

public class TokenBearer {
    public func saveToken(token: String){
        UserDefaults.standard.set(token, forKey: "token")
    }
    
    public func deleteToken(){
        UserDefaults.standard.set(nil, forKey: "token")
    }
    
    public static func getToken() -> String?{
        if let token = UserDefaults.standard.value(forKey: "token") as? String{
            return token
        }else{
            return nil
        }
    }
}

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
    public init() {}
    public var clientId: String?{
        return nil
    }
    public var clientSecret: String?{
        return nil
    }
    public var apiURL: URL{
        return URL(string: UserDefaults.standard.value(forKey: "apiURLPrivate") as! String)!
    }
    
    public static func settingsPrivateData(apiURL: String!){
        UserDefaults.standard.setValue(apiURL, forKey: "apiURLPrivate")
    }
}

public class Public: Client{
    public init() {}
    public var Isclient: Bool = true
    
    public var clientId: String?{
        return Isclient ? UserDefaults.standard.value(forKey: "clientPublicId") as? String : nil
    }
    public var clientSecret: String?{
        return Isclient ? UserDefaults.standard.value(forKey: "clientPublicSecret") as? String : nil
    }
    public var apiURL: URL{
        return URL(string: UserDefaults.standard.value(forKey: "apiURLPublic") as! String)!
    }
    
    public static func settingsPublicData(clientId: String? = nil, clientSecret: String? = nil, apiURL: String!){
        UserDefaults.standard.setValue(clientId, forKey: "clientPublicId")
        UserDefaults.standard.setValue(clientSecret, forKey: "clientPublicSecret")
        UserDefaults.standard.setValue(apiURL, forKey: "apiURLPublic")
    }
}

public class TokenBearer {
    public static func saveToken(token: String){
        UserDefaults.standard.set(token, forKey: "token")
    }
    
    public static func deleteToken(){
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

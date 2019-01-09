//
//  Variables.swift
//  BritaniaReceitas
//
//  Created by Laryssa Castagnoli on 01/12/18.
//  Copyright © 2018 Solid. All rights reserved.
//

import Foundation


protocol Client {
    var clientId: String? {get}
    var clientSecret: String? {get}
    var apiURL: URL {get}
}

class Private: Client{
    
    var clientId: String?{
        return nil
    }
    var clientSecret: String?{
        return nil
    }
    var apiURL: URL{
        
        return URL(string: "url api private")!
    }
}

class Public: Client{
    var Isclient: Bool = true
    var clientId: String?{
        return Isclient ? "client id" : nil
    }
    var clientSecret: String?{
        return Isclient ? "client secret" : nil
    }
    var apiURL: URL{
        return URL(string: "url api public")!
    }
}

class Token {
    func saveToken(token: String){
        UserDefaults.standard.set(token, forKey: "token")
    }
    
    func deleteToken(){
        UserDefaults.standard.set(nil, forKey: "token")
    }
    
    static func getToken() -> String?{
        if let token = UserDefaults.standard.value(forKey: "token") as? String{
            return token
        }else{
            return nil
        }
    }
}

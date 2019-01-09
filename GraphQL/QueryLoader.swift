//
//  Queries.swift
//  BritaniaReceitas
//
//  Created by Laryssa Castagnoli on 30/11/18.
//  Copyright © 2018 Solid. All rights reserved.
//
//
import UIKit

public enum QueryType: String {
    case login = "login"
    case createUser = "createUser"
    case profile = "profile"
    case recoveryPassword = "recoveryPassword"
    case topRecipes = "topRecipes"
    case allRecipes = "allRecipes"
    case lastRecipes = "lastRecipes"
    case allCategories = "allCategories"
    case gradeToRecipe = "gradeToRecipe"
    case searchForCategory = "searchForCategory"
    case searchRecipe = "searchRecipe"
    case favoriteRecipe = "favoriteRecipe"
    case updateUser = "updateUser"
    case notifications = "notifications"
    case deleteNotification = "deleteNotification"
    case favorites = "favorites"
    case facebookLogin = "facebookLogin"
    case facebookSignup = "facebookSignup"
    case uploadData = "uploadData"
    case registerToken = "registerToken"
}

class QueryLoader{
    let queryString: String
    
    init(type: QueryType, attribute: String? = nil) {
        queryString = QueryLoader.loadQueryFile(type: type, attribute: attribute)!
    }
    
    static func loadQueryFile(type: QueryType, attribute: String?) -> String? {
        guard let path = Bundle.main.path(forResource: type.rawValue, ofType: "query") else {
            return nil
        }
        
        do {
            var content = try String(contentsOfFile:path, encoding: String.Encoding.utf8)
            if let attributeString = attribute{
                content = content.replacingOccurrences(of: "attributeString", with: attributeString)
            }
            return content
        } catch {
            return nil
        }
    }
}

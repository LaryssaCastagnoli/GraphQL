//
//  Queries.swift
//  BritaniaReceitas
//
//  Created by Laryssa Castagnoli on 30/11/18.
//  Copyright © 2018 Solid. All rights reserved.
//
//
import UIKit

enum QueryType: String {
    case defaultType = "defaultType"
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

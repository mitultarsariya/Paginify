//
//  EndPointType.swift
//  Paginify
//
//  Created by iMac on 02/05/24.
//

import Foundation

enum HTTPMethods: String {
    case get = "GET"
}

protocol EndPointType {
    var baseURL: String { get }
    var path: String { get }
    var url: URL? { get }
    var method: HTTPMethods { get }
}

enum EndPointItem {
    case posts(page: Int)
}

extension EndPointItem: EndPointType {
    
    var baseURL: String {
        switch self {
        case .posts:
            return "https://jsonplaceholder.typicode.com/"
        }
    }
    
    var path: String {
        switch self {
        case .posts(let page):
            return "posts?_page=\(page)"
        }
    }
    
    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }
    
    var method: HTTPMethods {
        switch self {
        case .posts:
            return .get
        }
    }
    
}

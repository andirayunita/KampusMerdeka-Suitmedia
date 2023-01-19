//
//  APIConstant.swift
//  KMSuitmedia
//
//  Created by Andira Yunita on 18/01/23.
//

import Foundation

class APIConstant {
    static let urlUser: URL = {
        return URL(string: "https://reqres.in/api/users?page=2")
    }() ?? URL(string: "Invalid URL")!
}

//
//  UserModel.swift
//  KMSuitmedia
//
//  Created by Andira Yunita on 18/01/23.
//

import Foundation

struct DataAPI: Decodable {
    var page: Int
    var per_page: Int
    var total: Int
    var total_pages: Int
    var data: [DataUser]
}

struct DataUser: Decodable {
    var id: Int?
    var email: String?
    var first_name: String?
    var last_name: String?
    var avatar: String?
}

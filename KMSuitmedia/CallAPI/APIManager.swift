//
//  APIManager.swift
//  KMSuitmedia
//
//  Created by Andira Yunita on 18/01/23.
//

import Foundation

class APIManager {
    func parseJson(completion: @escaping ([DataUser]) ->()) {
        let dataTask = URLSession.shared.dataTask(with: APIConstant.urlUser) { data, response, error in
            if error == nil, data != nil {
                do {
                    let result = try JSONDecoder().decode(DataAPI.self, from: data!)
                    completion(result.data)
                } catch {
                    print("Fetch failed: \(error.localizedDescription)")
                }
            }
        }
        dataTask.resume()
    }
}

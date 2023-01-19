//
//  String.swift
//  KMSuitmedia
//
//  Created by Andira Yunita on 18/01/23.
//

import Foundation

extension String {
    func string(_ separatedBy: CharacterSet, _ joinedBy: String) -> String {
        return self.components(separatedBy: separatedBy).joined(separator: joinedBy)
    }
}

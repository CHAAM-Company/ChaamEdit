//
//  UserModel.swift
//  SABO
//
//  Created by Wonhyuk Choi on 2022/10/09.
//

import Foundation

struct User: Identifiable {
    var id: String
    var name: String
    var description: String
    var profileImageUrl: String?
}

//
//  CardCellModel.swift
//  SABO
//
//  Created by leejunmo on 2022/10/09.
//

import Foundation
import SwiftUI

struct CardCell: Identifiable {
    var id: String
    var time: Int
    var imageUrl: String
    var title: String
    var profileImageUrl: String
    var creatorId: String
}

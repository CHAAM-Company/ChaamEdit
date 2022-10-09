//
//  CardCellModel.swift
//  SABO
//
//  Created by leejunmo on 2022/10/09.
//

import Foundation
import SwiftUI

struct CardCell: Identifiable, Hashable {
    var id: String
    var time: Int
    var title: String
    var orginImageUrl: String
    var fixedImageUrl: String
    var resizedOrignImageUrl: String
    var resizedFixedImageUrl: String
    var calibrationValue: [Double]
    var creatorId: String
    var creatorProfileImageUrl: String
}

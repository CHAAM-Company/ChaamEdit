//
//  CardModel.swift
//  SABO
//
//  Created by leejunmo on 2022/10/09.
//

import SwiftUI
import Foundation

struct Card {
    var id: String
    var createdTime: Date
    var title: String
    var orginImageUrl: String
    var fixedImageUrl: String
    var resizedOrignImageUrl: String
    var resizedFixedImageUrl: String
    var calibrationValue: Calibration
    var creator: String
}

struct Calibration: Codable {
    var contrast: Double
    var saturation: Double
    var exposure: Double
    var whiteBalance: Double
}

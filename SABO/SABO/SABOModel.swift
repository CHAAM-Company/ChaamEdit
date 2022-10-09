//
//  SABOModel.swift
//  SABO
//
//  Created by Hong jeongmin on 2022/10/08.
//

import Foundation
import SwiftUI

struct SABAModel: Hashable {
    let title: String
    let definition: String
    let feature: String
    let quote: String
    let icon: UIImage?
    let image: UIImage?
}

let listArray: [SABAModel] = [
    SABAModel(title: "노출", definition: "채도는 색상의 강도를 말합니다", feature: "채도는 이미지의 분위기를 좌우합니다.\n채도가 너무 높으면 사진이 너무 인위적으로 보일수 있습니다.", quote: "\"주변 광은 색상의 채도를 줄이기 때문에 자연에서 순색을 보는 것은 불가능에 가깝습니다. 따라서 채도를 과하게 높이지 말아야 합니다.\" -사진작가 헤더 반스(Heather Barnes)", icon: UIImage(systemName: "plusminus.circle.fill"), image: UIImage(named: "test")),
    SABAModel(title: "채도", definition: "채도는 색상의 강도를 말합니다", feature: "채도는 이미지의 분위기를 좌우합니다.\n채도가 너무 높으면 사진이 너무 인위적으로 보일수 있습니다.", quote: "\"주변 광은 색상의 채도를 줄이기 때문에 자연에서 순색을 보는 것은 불가능에 가깝습니다. 따라서 채도를 과하게 높이지 말아야 합니다.\" -사진작가 헤더 반스(Heather Barnes)",icon: UIImage(systemName: "plus"), image: UIImage(named: "test")),
    SABAModel(title: "화이트 밸런스", definition: "채도는 색상의 강도를 말합니다", feature: "채도는 이미지의 분위기를 좌우합니다.\n채도가 너무 높으면 사진이 너무 인위적으로 보일수 있습니다.", quote: "\"주변 광은 색상의 채도를 줄이기 때문에 자연에서 순색을 보는 것은 불가능에 가깝습니다. 따라서 채도를 과하게 높이지 말아야 합니다.\" -사진작가 헤더 반스(Heather Barnes)",icon: UIImage(systemName: "plus"), image: UIImage(named: "test")),
    SABAModel(title: "대비", definition: "채도는 색상의 강도를 말합니다", feature: "채도는 이미지의 분위기를 좌우합니다.\n채도가 너무 높으면 사진이 너무 인위적으로 보일수 있습니다.", quote: "\"주변 광은 색상의 채도를 줄이기 때문에 자연에서 순색을 보는 것은 불가능에 가깝습니다. 따라서 채도를 과하게 높이지 말아야 합니다.\" -사진작가 헤더 반스(Heather Barnes)",icon: UIImage(systemName: "plus"), image: UIImage(named: "test")),
]

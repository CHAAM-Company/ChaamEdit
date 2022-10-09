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
    SABAModel(title: "노출", definition: "노출은 사진의 밝기를 나타냅니다.", feature: "노출의 기본적인 원리는 카메라에 들어오는 빛의 양입니다.", quote: "노출도가 높을 시 주로 밝고 역동적으로 사진이 표현됩니다.\n\n노출도가 낮을 시 주로 어둡고 정적으로 사진이 나타납니다.", icon: UIImage(systemName: "plusminus.circle.fill"), image: UIImage(named: "test")),
    SABAModel(title: "채도", definition: "채도는 색상의 강도를 말합니다", feature: "채도는 이미지의 분위기를 좌우합니다.\n채도가 너무 높으면 사진이 너무 인위적으로 보일수 있습니다.", quote: "\"주변 광은 색상의 채도를 줄이기 때문에 자연에서 순색을 보는 것은 불가능에 가깝습니다. 따라서 채도를 과하게 높이지 말아야 합니다.\" -사진작가 헤더 반스(Heather Barnes)",icon: UIImage(systemName: "plus"), image: UIImage(named: "test")),
    SABAModel(title: "화이트 밸런스", definition: "화이트밸런스는 사진의 온도(분위기)를 결정합니다.", feature: "사진은 육안으로 보는 것과 달리 흰색이 주변 조명에 따라 노란빛 또는 푸른빛을 띌 수 있습니다.", quote: "화이트밸런스는 사진에 영향을 주는 조명, 빛으로 인해 발생하는 색상의 차이를 조정할 수 있습니다.\n화이트밸런스를 사용하여 따뜻한 이미지부터 차가운 이미지까지 사진의 온도를 조절할 수 있습니다.",icon: UIImage(systemName: "plus"), image: UIImage(named: "test")),
    SABAModel(title: "대비", definition: "대비는 사진 내 색들의 밝고 어두운 정도를 나타내는 용어입니다.", feature: "이것은 색의 명암에서 나오는 현상입니다.", quote: "대비의 조절은 색채의 명암차이를 조절할 수 있습니다.\n어두운 요소와 밝은 요소를 적절히 조화시키고 균형을 맞출 때 사진에 통일성을 부여합니다.",icon: UIImage(systemName: "plus"), image: UIImage(named: "test")),
]

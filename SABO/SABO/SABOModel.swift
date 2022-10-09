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
    let icon: UIImage?
    let image: UIImage?
}

let listArray: [SABAModel] = [
    SABAModel(title: "노출", definition: "노출은 사진의 밝기를 나타냅니다.\n노출의 기본적인 원리는 카메라에 들어오는 빛의 양입니다.", feature: "노출도가 높을 시 주로 밝고 역동적으로 사진이 표현됩니다.\n\n노출도가 낮을 시 주로 어둡고 정적으로 사진이 나타납니다.", icon: UIImage(named: "Exposure"), image: UIImage(named: "test")),
    SABAModel(title: "채도", definition: "채도는 하나의 색이 가지고 있는 옅고 짙은 정도입니다.", feature: "채도는 이미지의 분위기를 좌우합니다.\n\n채도를 높이면 사진에 따라 차이가 있으나 선명도를 향상시킬 수 있습니다.\n\n하지만 과다하게 적용하면 사진의 세밀한 부분을 잃을 수 있습니다.\n\n반대로 채도가 너무 낮다면 무채색으로 사진이 변화합니다.",icon: UIImage(named: "saturation"), image: UIImage(named: "test")),
    SABAModel(title: "화이트 밸런스", definition: "화이트밸런스는 사진의 온도(분위기)를 결정합니다.", feature: "사진은 육안으로 보는 것과 달리 흰색이 주변 조명에 따라 노란빛 또는 푸른빛을 띌 수 있습니다.\n\n화이트밸런스는 사진에 영향을 주는 조명, 빛으로 인해 발생하는 색상의 차이를 조정할 수 있습니다.\n\n화이트밸런스를 사용하여 따뜻한 이미지부터 차가운 이미지까지 사진의 온도를 조절할 수 있습니다.",icon: UIImage(named: "temperature"), image: UIImage(named: "test")),
    SABAModel(title: "대비", definition: "대비는 사진 내 색들의 밝고 어두운 정도를 나타내는 용어입니다.", feature: "이것은 색의 명암에서 나오는 현상입니다.\n\n대비의 조절은 색채의 명암차이를 조절할 수 있습니다.\n어두운 요소와 밝은 요소를 적절히 조화시키고 균형을 맞출 때 사진에 통일성을 부여합니다." ,icon: UIImage(named: "Contrast"), image: UIImage(named: "test")),
]

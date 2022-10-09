//
//  MultiGalleryView.swift
//  SABO
//
//  Created by 이재웅 on 2022/10/09.
//

import SwiftUI

struct MultiGalleryView: View {
    // Test Data
    let data = Array(1...8).map { "목록 \($0)"}
    
    let columns = [
        GridItem(.adaptive(minimum: 160)),
        GridItem(.adaptive(minimum: 160))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text("보면 볼수록 늘어나는 편집 지식")
                        .multilineTextAlignment(.leading)
                        .font(.system(size: 32, weight: .bold))
                        .frame(height: 80)
                        .allowsTightening(false)
                        .padding(.horizontal)
                    
                    LazyVGrid(columns: columns) {
                        ForEach(data, id: \.self) { i in
                            ZStack {
                                //TODO: MultiGalleryRow로 구현 후 변경필요
                                Rectangle()
                                    .fill(Color.yellow)
                                    .frame(height: 170.0)
                                VStack {
                                    Spacer()
                                    Text(i)
                                }
                            }
                            .padding()
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

struct MultiGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        MultiGalleryView()
    }
}

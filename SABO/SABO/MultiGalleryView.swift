//
//  MultiGalleryView.swift
//  SABO
//
//  Created by 이재웅 on 2022/10/09.
//

import SwiftUI

struct MultiGalleryView: View {
    // Test Data
    @State var data = [TestData(title: "저쩌고임", image: UIImage(named: "DummyGalleryImage") ?? UIImage(), userImage: UIImage(named: "DummyProfileImage") ?? UIImage(), cardID: ""),
                       TestData(title: "저쩌고임", image: UIImage(named: "DummyGalleryImage") ?? UIImage(), userImage: UIImage(named: "DummyProfileImage") ?? UIImage(), cardID: "1"),
                       TestData(title: "저쩌고임", image: UIImage(named: "DummyGalleryImage") ?? UIImage(), userImage: UIImage(named: "DummyProfileImage") ?? UIImage(), cardID: "2")]
    
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
                        ForEach($data, id: \.self) { i in
                            ZStack {
                                GalleryCell(title: i.title, image: i.image, userImage: i.userImage, cardID: i.cardID)
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


struct MultiGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        MultiGalleryView()
    }
}

// Test Struct
struct TestData: Hashable {
    var title: String
    var image: UIImage
    var userImage: UIImage
    var cardID: String
}

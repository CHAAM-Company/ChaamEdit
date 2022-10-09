//
//  MultiGalleryView.swift
//  SABO
//
//  Created by 이재웅 on 2022/10/09.
//

import SwiftUI

struct MultiGalleryView: View {
    // Test Data
    var data = [TestData(title: "커리사진 1", image: UIImage(named: "DummyGalleryImage") ?? UIImage(), userImage: UIImage(named: "DummyProfileImage") ?? UIImage(), cardID: ""),
                       TestData(title: "카레사진 2", image: UIImage(named: "DummyGalleryImage") ?? UIImage(), userImage: UIImage(named: "DummyProfileImage") ?? UIImage(), cardID: "1"),
                       TestData(title: "이재웅사진 3", image: UIImage(named: "DummyGalleryImage") ?? UIImage(), userImage: UIImage(named: "DummyProfileImage") ?? UIImage(), cardID: "2")]
    
    @State private var searchQueryString = ""
    
    var filteredData: [TestData] {
        if searchQueryString == "" {
            return data
        } else {
            return data.filter { $0.title.localizedStandardContains(searchQueryString) }
        }
    }
    
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
                    
                    SearchBar(text: $searchQueryString)
                    
                    LazyVGrid(columns: columns) {
                        ForEach(filteredData, id: \.self) { i in
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

//
//  MultiGalleryView.swift
//  SABO
//
//  Created by 이재웅 on 2022/10/09.
//

import SwiftUI

struct MultiGalleryView: View {
    @EnvironmentObject var cardVM: CardViewModel
    @State private var searchQueryString = ""
    
    var filteredData: [CardCell] {
        if searchQueryString == "" {
            return cardVM.mainCards
        } else {
            return cardVM.mainCards.filter { $0.title.localizedStandardContains(searchQueryString) }
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
                                GalleryCell(title: i.title, imageUrl: i.resizedFixedImageUrl, userImageUrl: i.creatorProfileImageUrl, cardID: i.creatorId)
                                    .environmentObject(cardVM)
                            }
                        }
                        .padding()
                    }
                }
            }
            .padding(.horizontal)
            .onAppear() {
                cardVM.fetchMainCardGrid()
            }
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

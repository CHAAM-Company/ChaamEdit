//
//  UserPostView.swift
//  SABO
//
//  Created by blackRaven on 2022/10/09.
//

import SwiftUI

//struct TestData: Hashable {
//    var title: String
//    var image: UIImage
//    var userImage: UIImage
//    var cardID: String
//}

struct UserPostGalleryView: View {
//    var data = [TestData(title: "Gallary 1", image: UIImage(named: "test") ?? UIImage(), userImage: UIImage(named: "test") ?? UIImage(), cardID: ""),
//    TestData(title: "Gallary 2", image: UIImage(named: "test") ?? UIImage(), userImage: UIImage(named: "test") ?? UIImage(), cardID: "1"),
//    TestData(title: "Gallary 3", image: UIImage(named: "test") ?? UIImage(), userImage: UIImage(named: "test") ?? UIImage(), cardID: "2")]
    
    
    let columns = [
        GridItem(.adaptive(minimum: 160)),
        GridItem(.adaptive(minimum: 160))
    ]
    
    var body: some View {
        VStack {
            UserPostTitleView()
            NavigationView {
                  ScrollView {
                      VStack(alignment: .leading) {
                          LazyVGrid(columns: columns) {
                              ForEach([1,2,3,4,5,6,7,8], id: \.self) { i in
                                  ZStack {
                                      UserPostGalleryCellView()
                                  }
                              }
                              
                          }
                      }
                  }
              }
        }
    }
}

struct UserPostView_Previews: PreviewProvider {
    static var previews: some View {
        UserPostGalleryView()
    }
}

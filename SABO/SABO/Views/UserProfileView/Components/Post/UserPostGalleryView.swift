//
//  UserPostView.swift
//  SABO
//
//  Created by blackRaven on 2022/10/09.
//

import SwiftUI


struct UserPostGalleryView: View {
    @EnvironmentObject var cardVM: CardViewModel
    @EnvironmentObject var userVM: UserViewModel
    
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
                              ForEach(cardVM.userCards, id: \.self) { i in
                                  ZStack {
                                      GalleryCell(card: i)
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

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
    
    var filteredData: [CardCell] {
        return cardVM.mainCards.filter { i in
            i.creatorId == userVM.user?.id
        }
    }
    
    var body: some View {
        VStack {
            UserPostTitleView()
                .environmentObject(cardVM)
                .environmentObject(userVM)
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading) {
                        LazyVGrid(columns: columns) {
                            ForEach(filteredData, id: \.self) { i in
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

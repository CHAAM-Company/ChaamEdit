//
//  UserProfileView.swift
//  SABO
//
//  Created by blackRaven on 2022/10/09.
//

import SwiftUI

struct UserProfileView: View {
    @EnvironmentObject var userVM: UserViewModel
    @EnvironmentObject var cardVM: CardViewModel
    
    var body: some View {
        VStack() {
            UserInformationView()
                .environmentObject(userVM)
            UserPostGalleryView()
                .environmentObject(userVM)
                .environmentObject(cardVM)
        }
        .padding(.top)
    }
}

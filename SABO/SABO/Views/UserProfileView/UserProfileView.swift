//
//  UserProfileView.swift
//  SABO
//
//  Created by blackRaven on 2022/10/09.
//

import SwiftUI

struct UserProfileView: View {
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        VStack() {
            UserInformationView()
                .environmentObject(userVM)
            UserPostGalleryView()
        }
        .padding(.top)
    }
}

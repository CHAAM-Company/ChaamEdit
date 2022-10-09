//
//  UserProfileView.swift
//  SABO
//
//  Created by blackRaven on 2022/10/09.
//

import SwiftUI

struct UserProfileView: View {
    var body: some View {
        VStack() {
            UserInformationView()
            UserPostGalleryView()
        }.padding(.top)
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}

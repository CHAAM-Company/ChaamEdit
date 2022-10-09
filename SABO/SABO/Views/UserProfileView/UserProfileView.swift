//
//  UserProfileView.swift
//  SABO
//
//  Created by blackRaven on 2022/10/09.
//

import SwiftUI

struct UserProfileView: View {
    let myProfileImage: UIImage
    let myName: String
    let myJob: String
    
    var body: some View {
        VStack() {
            UserInformationView(myProfileImage: myProfileImage,myName: myName, myJob: myJob)
            UserPostGalleryView()
        }.padding(.top)
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(myProfileImage: UIImage(named: "grid")!, myName: "", myJob: "")
    }
}

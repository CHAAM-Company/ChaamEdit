//
//  UserInformationView.swift
//  SABO
//
//  Created by blackRaven on 2022/10/09.
//

import SwiftUI

struct UserInformationView: View {
    let myProfileImage: UIImage
    let myName: String
    let myJob: String
    
    var body: some View {
        HStack(spacing: 21) {
            UserAvatarView(myProfileImage: myProfileImage)
            UserDetailView(myName: myName, myJob: myJob)
            Spacer()
        }
        .padding(EdgeInsets(top: 0, leading: 27, bottom: 0, trailing: 27))
    }
}

struct UserInformationView_Previews: PreviewProvider {
    static var previews: some View {
        UserInformationView(myProfileImage: UIImage(named: "grid")!, myName: "", myJob: "")
    }
}

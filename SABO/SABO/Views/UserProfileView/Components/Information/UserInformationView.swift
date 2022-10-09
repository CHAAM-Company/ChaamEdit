//
//  UserInformationView.swift
//  SABO
//
//  Created by blackRaven on 2022/10/09.
//

import SwiftUI

struct UserInformationView: View {
    var body: some View {
        HStack(spacing: 21) {
            UserAvatarView()
            UserDetailView()
            Spacer()
        }
        .padding(EdgeInsets(top: 0, leading: 27, bottom: 0, trailing: 27))
    }
}

struct UserInformationView_Previews: PreviewProvider {
    static var previews: some View {
        UserInformationView()
    }
}

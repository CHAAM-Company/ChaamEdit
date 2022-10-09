//
//  UserInformationView.swift
//  SABO
//
//  Created by blackRaven on 2022/10/09.
//

import SwiftUI

struct UserInformationView: View {
    @EnvironmentObject var userVM: UserViewModel
    
    var body: some View {
        HStack(spacing: 21) {
            UserAvatarView()
                .environmentObject(userVM)
            UserDetailView(myName: userVM.user?.name ?? "", myJob: userVM.user?.description ?? "")
            Spacer()
        }
        .padding(EdgeInsets(top: 0, leading: 27, bottom: 0, trailing: 27))
    }
}

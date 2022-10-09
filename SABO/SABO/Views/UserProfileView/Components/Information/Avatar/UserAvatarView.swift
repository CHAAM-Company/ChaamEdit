//
//  UserAvatarView.swift
//  SABO
//
//  Created by blackRaven on 2022/10/09.
//

import SwiftUI
import PhotosUI

struct UserAvatarView: View {
    @EnvironmentObject var userVM: UserViewModel
    @State var newImg: UIImage = UIImage()
    @State var isPickerPressed = false
    
    var body: some View {
        
        Image(uiImage: userVM.userProfileImage ?? UIImage(named: "grid")!)
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
            .overlay(
                Image("pencil")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .background(
                        Color("TabColor")
                            .frame(width: 30, height: 30)
                            .clipShape(Circle())
                    )
                    .padding(8)
                    .clipShape(Circle())
                    .offset(x:35, y:-35)
                    .frame(width: 30, height: 30)
                    .onTapGesture {
                        isPickerPressed = true
                    }
            )
            .fullScreenCover(isPresented: $isPickerPressed) {
                PhotoPickerView(selectedImage: $newImg)
                    .onDisappear {
                        userVM.uploadProfileImage(image: newImg)
                    }
            }
    }
}

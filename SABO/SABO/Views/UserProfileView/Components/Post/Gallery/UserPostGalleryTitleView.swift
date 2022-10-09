//
//  UserPostGalleryTitleView.swift
//  SABO
//
//  Created by blackRaven on 2022/10/09.
//

import SwiftUI

struct UserPostGalleryTitleView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            //MARK: Picture Title
            Image("test")
                .resizable()
                .frame(width: 33, height: 33)
                .scaledToFit()
                .clipShape(Circle())
            Text("샘플 사진입니다.")
                .font(.system(size: 12.0, weight: .bold))
                .fontWeight(.bold)
                .truncationMode(.tail)
                .lineLimit(1)
        }
        .padding(6)
        .background(.clear)
    }
}

struct UserPostGalleryTitleView_Previews: PreviewProvider {
    static var previews: some View {
        UserPostGalleryTitleView()
    }
}

//
//  UserPostGalleryView.swift
//  SABO
//
//  Created by blackRaven on 2022/10/09.
//

import SwiftUI

struct UserPostGalleryCellView: View {
    
    
    var body: some View {
        ZStack {
            Image("test")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(16.0)
                .mask(LinearGradient(gradient: Gradient(colors: [.white, .white, .clear]), startPoint: .top, endPoint: .bottom))
            
            VStack {
                Spacer()
                HStack {
                    UserPostGalleryTitleView()
                    Spacer()
                }
                .frame(width: 160)
            }
            .frame(width: 160)
        }
        .redacted(reason: [] == nil ? .placeholder : [])
        .frame(width: 160, height: 160)
        .cornerRadius(16.0)
    }
}

struct UserPostGalleryView_Previews: PreviewProvider {
    static var previews: some View {
        UserPostGalleryCellView()
    }
}

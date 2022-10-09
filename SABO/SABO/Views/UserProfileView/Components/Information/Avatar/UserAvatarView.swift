//
//  UserAvatarView.swift
//  SABO
//
//  Created by blackRaven on 2022/10/09.
//

import SwiftUI

struct UserAvatarView: View {
    
    var body: some View {
        
            Image("test")
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
                 
                )
        
    }
}

struct UserAvatarView_Previews: PreviewProvider {
    static var previews: some View {
        UserAvatarView()
    }
}

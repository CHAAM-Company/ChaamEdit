//
//  UserPostTitleView.swift
//  SABO
//
//  Created by blackRaven on 2022/10/09.
//

import SwiftUI

struct UserPostTitleView: View {
    var body: some View {
        HStack {
            Text("Posts")
                .font(.system(size:20))
                .fontWeight(.bold)
            Spacer()
            
            Image(systemName: "plus.circle.fill")
                .foregroundColor(Color("TabColor"))
                .font(.system(size:32))
        }
        .padding(EdgeInsets(top: 0, leading: 27, bottom: 0, trailing: 27))
    }
}

struct UserPostTitleView_Previews: PreviewProvider {
    static var previews: some View {
        UserPostTitleView()
    }
}

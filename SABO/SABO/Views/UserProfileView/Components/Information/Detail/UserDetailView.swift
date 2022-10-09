//
//  UserDetailView.swift
//  SABO
//
//  Created by blackRaven on 2022/10/09.
//

import SwiftUI

struct UserDetailView: View {
    var body: some View {
        VStack(alignment: .leading) {
            //MARK: Binder
            Text("Black__Raven")
                .font(.system(size:24))
                .fontWeight(.semibold)
                .truncationMode(.tail)
                .padding(2)
            Text("크리에이터")
                .foregroundColor(.gray)
                .truncationMode(.tail)
            
        }
        
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView()
    }
}

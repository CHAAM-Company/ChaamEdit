//
//  UserDetailView.swift
//  SABO
//
//  Created by blackRaven on 2022/10/09.
//

import SwiftUI

struct UserDetailView: View {
    let myName: String
    let myJob: String
    
    var body: some View {
        VStack(alignment: .leading) {
            //MARK: Binder
            Text(myName)
                .font(.system(size:24))
                .fontWeight(.semibold)
                .truncationMode(.tail)
                .padding(2)
            Text(myJob)
                .foregroundColor(.gray)
                .truncationMode(.tail)
            
        }
        
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(myName: "", myJob: "")
    }
}

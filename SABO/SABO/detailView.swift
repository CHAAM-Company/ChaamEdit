//
//  detailView.swift
//  SABO
//
//  Created by 이창형 on 2022/10/08.
//

import SwiftUI

struct detailView: View {
    var body: some View {
        VStack{
            Image("test")
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .padding()
            Text("채도")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom)
            Text("반갑다반갑다반갑다반갑다반갑다반갑다반갑다반갑다반갑다반갑다반갑다반갑다반갑다반갑다반갑다반갑다반갑다반갑다반갑다반갑다")
                .padding(.horizontal)
            Spacer()
        }
    }
}

struct detailView_Previews: PreviewProvider {
    static var previews: some View {
        detailView()
    }
}

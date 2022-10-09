//
//  detailView.swift
//  SABO
//
//  Created by 이창형 on 2022/10/08.
//

import SwiftUI

struct DetailView: View {
    var item: SABAModel
    
    var body: some View {
        VStack{
            Image(uiImage: item.image ?? UIImage())
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
                .padding()
            Text("\(item.title)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom)
            VStack(alignment: .leading) {
                Text("\(item.definition)")
                    .padding([.horizontal, .bottom])
                Text("\(item.feature)")
                    .padding([.horizontal, .bottom])
                Text("\(item.quote)")
                    .padding([.horizontal, .bottom])
                Spacer()
            }
        }
    }
}
//
//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}

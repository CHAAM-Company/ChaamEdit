//
//  SearchBar.swift
//  SABO
//
//  Created by 이재웅 on 2022/10/09.
//

import SwiftUI

struct SearchBar: View {
    // TextField의 텍스트를 받는 변수
    @Binding var text: String
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                
                TextField("Search", text: $text)
                    .foregroundColor(.primary)
                
                if !text.isEmpty {
                    Button(action: {
                        self.text = ""
                    }) {
                        Image(systemName: "xmark.circle.fill")
                    }
                } else {
                    EmptyView()
                }
                
            }
            .padding(EdgeInsets(top: 4.0, leading: 8.0, bottom: 4.0, trailing: 8.0))
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)
        }
        .padding(.horizontal)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}

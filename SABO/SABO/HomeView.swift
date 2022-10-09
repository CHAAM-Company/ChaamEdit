//
//  ContentView.swift
//  SABO
//
//  Created by Hong jeongmin on 2022/10/08.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        NavigationView {
            VStack{
                HStack{
                    Text("사진편집 기능을\n알고싶다면?")
                        .font(.system(size: 38))
                        .fontWeight(.bold)
                        .padding(.leading)
                    Spacer()
                }
                List {
                    ForEach(listArray, id:\.self) { item in
                        NavigationLink(destination: DetailView(item: item)) {
                            HStack {
                                Image(uiImage: item.icon ?? UIImage())
                                VStack {
                                    HStack{
                                        Text("\(item.title)")
                                            .font(.system(size: 22))
                                        Spacer()
                                    }
                                    HStack{
                                        Text("\(item.definition)")
                                            .font(.system(size: 16))
                                            .foregroundColor(.gray)
                                        Spacer()
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

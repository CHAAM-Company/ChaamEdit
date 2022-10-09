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
            .searchable(text: $searchText)
            .navigationTitle("사보")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

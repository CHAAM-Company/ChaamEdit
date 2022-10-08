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
                    VStack {
                        HStack{
                            Text("\(item.title)")
                            Spacer()
                        }
                        HStack{
                            Text("\(item.definition)")
                            Spacer()
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

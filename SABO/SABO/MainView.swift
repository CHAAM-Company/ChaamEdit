//
//  MainView.swift
//  SABO
//
//  Created by Hong jeongmin on 2022/10/09.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image("house")
                }
            Text("grid")
                .tabItem {
                    Image("grid")
                }
            Text("person")
            
                .tabItem {
                    Image(systemName: "person.circle.fill")
                }
        }
        .accentColor(Color("TabColor"))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

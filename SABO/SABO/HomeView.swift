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
            ZStack{
                Color("BackgroundColor")
                    .ignoresSafeArea()
                VStack{
                    HStack{
                        Text("사진편집 기능을\n알고싶다면?")
                            .font(.system(size: 38))
                            .fontWeight(.bold)
                            .padding(.leading)
                        Spacer()
                    }
                    ForEach(listArray, id:\.self) { item in
                        NavigationLink(destination: DetailView(item: item)) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 11)
                                    .fill(Color.white)
                                    .shadow(color: .black.opacity(0.1), radius: 6)
                                    .frame(height: 55)
                                    .padding(.horizontal)
                                    HStack {
                                        Image(uiImage: item.icon ?? UIImage())
                                        VStack {
                                            HStack{
                                                Text("\(item.title)")
                                                    .font(.system(size: 22))
                                                    .foregroundColor(Color("black"))
                                                    .fontWeight(.semibold)
                                                Spacer()
                                            }
                                        }
                                    }
                                    .padding(.horizontal)
                                    .padding(.horizontal)
                                }
                        }
                    }
                    Spacer()
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


/*
 NavigationLink(destination: DetailView(item: item)) {
 HStack {
 Image(uiImage: item.icon ?? UIImage())
 VStack {
 HStack{
 Text("\(item.title)")
 .font(.system(size: 22))
 Spacer()
 }
 }
 }
 }
 */

//
//  MainView.swift
//  SABO
//
//  Created by Hong jeongmin on 2022/10/09.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {
    @EnvironmentObject var cardVM: CardViewModel
    @EnvironmentObject var userVM: UserViewModel
    
    let firebaseAuth = Auth.auth()
    @State var isSignIn = false
    @State private var showModal = false
    
    var body: some View {
        ZStack {
            if isSignIn {
                TabView {
                    HomeView()
                        .tabItem {
                            Image("house")
                        }
                    MultiGalleryView()
                        .tabItem {
                            Image("grid")
                        }
                        .environmentObject(cardVM)
                    UserProfileView()
                        .environmentObject(userVM)
                        .environmentObject(cardVM)
                        .tabItem {
                            Image(systemName: "person.circle.fill")
                        }
                }
                .accentColor(Color("TabColor"))
                .onAppear {
                    if let user = firebaseAuth.currentUser {
                        userVM.getUserData(uid: user.uid) {
                            showModal = true
                        }
                    }
                }
                .sheet(isPresented: $showModal) {
                    RegisterView(userId: firebaseAuth.currentUser!.uid)
                        .environmentObject(userVM)
                }
            } else {
                LoginView(isSignIn: $isSignIn)
            }
        }
        .onAppear {
            if firebaseAuth.currentUser != nil {
                isSignIn = true
            } else {
                isSignIn = false
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

//
//  MainView.swift
//  SABO
//
//  Created by Hong jeongmin on 2022/10/09.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {
    let firebaseAuth = Auth.auth()
    @State var isSignIn = false
    @State private var showModal = false
    @StateObject var userVM = UserViewModel()
    
    var body: some View {
        ZStack {
            if isSignIn {
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
                .onAppear {
                    if let user = firebaseAuth.currentUser {
                        userVM.getUserData(uid: user.uid) {
                            showModal = true
                        }
                    }
                }
                .sheet(isPresented: $showModal) {
                    RegisterView(userVM: userVM, userId: firebaseAuth.currentUser!.uid)
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

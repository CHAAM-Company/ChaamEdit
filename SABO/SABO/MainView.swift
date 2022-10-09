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
    @ObservedObject var userVM = UserViewModel()
    
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
            } else {
                LoginView(isSignIn: $isSignIn)
            }
        }
        .onAppear {
            if firebaseAuth.currentUser != nil {
                isSignIn = true
                // userVM.getUserData(uid: firebaseAuth.currentUser!.uid)
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

//
//  LoginView.swift
//  SABO
//
//  Created by 이창형 on 2022/10/09.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .ignoresSafeArea()
                .foregroundColor(Color("TabColor"))
            VStack{
                
                ZStack{
                    Rectangle()
                        .frame(maxWidth: 150, maxHeight: 150)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                    //                        .position(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/3)
                    
                    Image("appIcon")
                    //                        .position(x: UIScreen.main.bounds.width/2, y: UIScreen.main.bounds.height/3)
                }
                .padding(.top, UIScreen.main.bounds.height/6)
                
                
                
                Text("사보")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 54)
                
                
                Text("모두를 위한 사진 보정")
                
                Spacer()
                
                Text("로그인 하기")
                    .bold()
                
                AppleLoginButton {
                    // 로그인 후 트리거
                }
                .padding(.bottom, 34)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

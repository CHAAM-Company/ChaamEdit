//
//  AppleLoginButton.swift
//  SABO
//
//  Created by Wonhyuk Choi on 2022/10/09.
//

import SwiftUI

struct AppleLoginButton: View {
    @Environment(\.window) var window: UIWindow?
    @State private var appleLoginCoordinator: AppleAuthCoordinator?
    
    let action: () -> Void
    
    var body: some View {
        Button {
            appleLogin()
        } label: {
            HStack(spacing: 10) {
                Image("applelogo")
                Text("Sign in with Apple")
                    .font(.system(size: 17, weight: .semibold))
                    .foregroundColor(.white)
            }
            .padding(.vertical, 15)
            .frame(minWidth: 0, maxWidth: .infinity)
        }
        .background(Color.black)
        .cornerRadius(100)
        .frame(width: 268)
    }
    
    func appleLogin() {
        appleLoginCoordinator = AppleAuthCoordinator(window: window) {
            self.action()
        }
        appleLoginCoordinator?.startSignInWithAppleFlow()
    }
}

struct AppleLoginButton_Previews: PreviewProvider {
    static var previews: some View {
        AppleLoginButton{}
            .previewLayout(.sizeThatFits)
    }
}

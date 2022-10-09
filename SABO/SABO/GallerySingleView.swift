
//  GallerySingleView.swift
//  SABO
//
//  Created by 이창형 on 2022/10/09.
//

import SwiftUI

struct GallerySingleView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack{
            VStack(spacing: 20){
                Image("DummyProfileImage")
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
                    .ignoresSafeArea()
                    .frame(height: UIScreen.main.bounds.height/2.3)
                
                
                
                
                Text("DOGGGGGGGGGGG")
                    .font(.title)
                    .bold()
                    .frame(maxWidth: UIScreen.main.bounds.width - 56, alignment: .leading)
                //                .padding()
                HStack(spacing: 0) {
                    Image("DummyProfileImage")
                        .resizable()
                        .frame(maxWidth: 45, maxHeight: 45)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading){
                        Text("Black_Raven")
                        Text("크리에이터")
                            .foregroundColor(.gray)
                        
                    }
                    .padding(.horizontal)
                    Spacer()
                    
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                .frame(maxWidth: UIScreen.main.bounds.width - 37)
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.gray, lineWidth: 0.5)
                )
                
                Text("현재 사진에 사용된 보정봅")
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: UIScreen.main.bounds.width - 56, alignment: .leading)
                
                HStack() {
                    Spacer()
                    VStack{
                        Image("Exposure")
                        Text("12")
                    }
                    Spacer()
                    VStack{
                        Image("Contrast")
                        Text("12")
                    }
                    Spacer()
                    VStack{
                        Image("temperature")
                        Text("12")
                    }
                    Spacer()
                    VStack{
                        Image("saturation")
                        Text("12")
                    }
                    Spacer()
                }
                
                
                
                
                
                
                
                Spacer()
            }
            
            HStack {
                VStack {
                    Button {
                        dismiss()
                    } label: {
                        Image("BackButton")
                            .padding(.horizontal)
                    }
                    Spacer()
                }
                Spacer()
            }
        }.navigationBarHidden(true)
    }
}

struct GallerySingleView_Previews: PreviewProvider {
    static var previews: some View {
        GallerySingleView()
    }
}


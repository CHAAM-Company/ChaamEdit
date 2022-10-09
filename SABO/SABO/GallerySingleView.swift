
//  GallerySingleView.swift
//  SABO
//
//  Created by 이창형 on 2022/10/09.
//

import SwiftUI
import FirebaseStorage

struct GallerySingleView: View {
    @EnvironmentObject var userVM: UserViewModel
    
    var card: CardCell
    
    @Environment(\.dismiss) var dismiss
    
    @State var image: Image = Image("grid")
    var body: some View {
        ZStack{
            VStack(spacing: 20){
                image
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
                    .ignoresSafeArea()
                    .frame(height: UIScreen.main.bounds.height/2.3)
                
                Text(card.title)
                    .font(.title)
                    .bold()
                    .frame(maxWidth: UIScreen.main.bounds.width - 56, alignment: .leading)
                //                .padding()
                HStack(spacing: 0) {
                    Image(uiImage: (userVM.userProfileImage ?? UIImage(named: "DummyProfileImage"))!)
                        .resizable()
                        .frame(maxWidth: 45, maxHeight: 45)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading){
                        Text(userVM.user?.name ?? "")
                        Text(userVM.user?.description ?? "")
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
                
                Text("현재 사진에 사용된 보정 값")
                    .font(.title2)
                    .bold()
                    .frame(maxWidth: UIScreen.main.bounds.width - 56, alignment: .leading)
                
                HStack() {
                    Spacer()
                    VStack{
                        Image("Exposure")
                        Text("\(card.calibrationValue[0])")
                    }
                    Spacer()
                    VStack{
                        Image("Contrast")
                        Text("\(card.calibrationValue[1])")
                    }
                    Spacer()
                    VStack{
                        Image("temperature")
                        Text("\(card.calibrationValue[2])")
                    }
                    Spacer()
                    VStack{
                        Image("saturation")
                        Text("\(card.calibrationValue[3])")
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
            .onAppear() {
                retrieveImage(url: card.fixedImageUrl)
            }
    }
    
    // MARK: - 이미지 다운로드
    func retrieveImage(url: String) {
        let storageRef = Storage.storage().reference()

        let fileRef = storageRef.child(url)
        fileRef.getData(maxSize: 5 * 640 * 640) { data, error in
            if error == nil && data != nil {
                if let image = UIImage(data: data!) {
                    DispatchQueue.main.async {
                        self.image = Image(uiImage: image)
                    }
                }
            }
        }
    }
}


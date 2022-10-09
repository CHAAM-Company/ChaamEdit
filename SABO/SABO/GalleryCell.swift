//
//  GalleryCell.swift
//  SABO
//
//  Created by 이재웅 on 2022/10/09.
//

import SwiftUI
import FirebaseStorage

struct GalleryCell: View {
    @EnvironmentObject var cardVM: CardViewModel
    
    var title: String
    var imageUrl: String
    var userImageUrl: String
    var cardID: String
    
    @State var image: Image = Image("grid")
    @State var profileImage: Image = Image("grid")
    
    var body: some View {
        ZStack {
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            VStack {
                Spacer()
                
                ZStack {
                    LinearGradient(
                        colors: [Color(hex: 0xF2F2F2, alpha: 1.0), Color(hex: 0xFFFFFF, alpha: 0.5), Color(hex: 0xFFFFFF, alpha: 0)],
                        startPoint: .bottom,
                        endPoint: .top
                    )
                        .frame(height: 45.0)
                    
                    HStack() {
                        profileImage
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 33.0, height: 33.0)
                            .cornerRadius(16.5)
                        
                        Text(title)
                            .font(.system(size: 12.0, weight: .bold))
                            .lineLimit(1)

                        Spacer()
                    }
                }
            }
        }
        .redacted(reason: [] == nil ? .placeholder : [])
        .frame(width: 160, height: 160)
        .cornerRadius(16.0)
        .onAppear() {
            retrieveImage(url: imageUrl, profilUrl: userImageUrl)
        }
    }
    
    // MARK: - 이미지 다운로드
    func retrieveImage(url: String, profilUrl: String) {
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
        
        let profileRef = storageRef.child(profilUrl)
        profileRef.getData(maxSize: 5 * 640 * 640) { data, error in
            if error == nil && data != nil {
                if let image = UIImage(data: data!) {
                    DispatchQueue.main.async {
                        self.profileImage = Image(uiImage: image)
                    }
                }
            }
        }
    }
}

//struct GalleryCell_Previews: PreviewProvider {
//    static var previews: some View {
//        GalleryCell(
//            title: "커리가 Async발표할 때",
//            image: UIImage(named: "DummyGalleryImage") ?? UIImage(),
//            userImage: UIImage(named: "DummyProfileImage") ?? UIImage(),
//            cardID: ""
//        )
//    }
//}

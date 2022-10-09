//
//  UserPostTitleView.swift
//  SABO
//
//  Created by blackRaven on 2022/10/09.
//

import SwiftUI

struct UserPostTitleView: View {
    @EnvironmentObject var cardVM: CardViewModel
    @EnvironmentObject var userVM: UserViewModel
    
    @State var newImg: UIImage = UIImage()
    @State var isPickerPressed = false
    @State var isChoosen = false
    
    var body: some View {
        HStack {
            Text("Posts")
                .font(.system(size:20))
                .fontWeight(.bold)
            Spacer()
            
            Image(systemName: "plus.circle.fill")
                .foregroundColor(Color("TabColor"))
                .font(.system(size:32))
                .onTapGesture {
                    isPickerPressed = true
                }
                .fullScreenCover(isPresented: $isPickerPressed) {
                    PhotoPickerView(selectedImage: $newImg)
                        .onDisappear {
                            isChoosen = true
                        }
                }
                .sheet(isPresented: $isChoosen) {
                    EditingView(image: $newImg)
                        .environmentObject(cardVM)
                        .environmentObject(userVM)
                }
        }
        .padding(EdgeInsets(top: 0, leading: 27, bottom: 0, trailing: 27))
    }
}

struct UserPostTitleView_Previews: PreviewProvider {
    static var previews: some View {
        UserPostTitleView()
    }
}

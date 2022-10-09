//
//  RegisterView.swift
//  SABO
//
//  Created by Wonhyuk Choi on 2022/10/09.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var userVM: UserViewModel
    @State var nickName: String = ""
    @State var job: String = ""
    
    let userId : String
    
    var body: some View {
        
        VStack (spacing: 12){
            Text("프로필 설정")
                .bold()
                .font(.title)
            TextField("닉네임", text: $nickName)
                .modifier(TextFieldClearButton(text: $nickName))
            TextField("직업", text: $job)
                .modifier(TextFieldClearButton(text: $job))
            
            Spacer()
            Button{
                if nickName.count > 0 && job.count > 0 {
                    userVM.addUserData(
                        uid: userId,
                        name: nickName,
                        description: job
                    )
                    self.presentationMode.wrappedValue.dismiss()
                }
            } label:{
                Text("완료")
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.pink)
                            .frame(width: UIScreen.main.bounds.width - 37)
                        
                    )
                    .foregroundColor(Color.white)
                
                
            }
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
        .interactiveDismissDisabled(true)
    }
}

struct TextFieldClearButton: ViewModifier {
    @Binding var text: String

    func body(content: Content) -> some View {
        HStack
        {
            content
            if !text.isEmpty {
                Button(
                    action: {
                        self.text = ""

                    })
                {
                    Image(systemName: "delete.lefdddeet")
                        .foregroundColor(Color(UIColor.opaqueSeparator))
                }
                .padding(.trailing, 8)
            }
        }
    }
}

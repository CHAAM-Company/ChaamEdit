//
//  EditingView.swift
//  SABO
//
//  Created by 이재웅 on 2022/10/09.
//

import SwiftUI
import BrightroomUI
import BrightroomEngine

struct EditingView: View {
    let editingStack = EditingStack(imageProvider: ImageProvider(image: UIImage(named: "appIcon") ?? UIImage() ))
    @State var image: UIImage?
    
    var body: some View {
        NavigationView {
            VStack {
                // ✅ Display a cropping view
                SwiftUIPhotosCropView(
                    editingStack: editingStack) {
                        do {
                            self.image = try editingStack.makeRenderer().render().uiImage
                            print("------이미지 프린트입니다------")
                            print(image)
                            print("------이미지 프린트입니다------")
                            
                        } catch {

                        }
                    } onCancel: {
                        print("취소됨")
                    }

                // ✅ Renders a result image from the current editing.
                
                NavigationLink(destination: PixelEditView(editingStack: editingStack) ) {
                    Text("Done")
                }.simultaneousGesture(
                    TapGesture().onEnded {
                        print("abc")
                    }
                )
            }
            .onAppear {
                editingStack.start()
            }
        }
    }
}

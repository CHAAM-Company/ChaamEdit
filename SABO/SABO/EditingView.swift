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
    //ImageProvider - Test Image
    let editingStack = EditingStack(imageProvider: ImageProvider(image: UIImage(named: "appIcon") ?? UIImage() ))
    
    var body: some View {
        VStack {
            // ✅ Display a cropping view
            SwiftUICropView(
                editingStack: editingStack
            )
            // ✅ Renders a result image from the current editing.
            Button("Done") {
                do {
                    let image: UIImage = try editingStack.makeRenderer().render().uiImage
                    print("------이미지 프린트입니다------")
                    print(image)
                    print("------이미지 프린트입니다------")
                } catch {
                    
                }
            }
        }
        .onAppear {
            editingStack.start()
        }
    }
}

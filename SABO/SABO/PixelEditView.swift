//
//  PixelEditView.swift
//  SABO
//
//  Created by 이재웅 on 2022/10/09.
//

import SwiftUI
import BrightroomUI
import BrightroomEngine


struct PixelEditView: View {
//    var image: UIImage
    var editingStack: EditingStack
    
    var body: some View {
        PixelEditingView(editindStack: editingStack)
            .onAppear {
                
            }
    }
}

//struct PixelEditView_Previews: PreviewProvider {
//    static var previews: some View {
//        PixelEditView(image: UIImage(named: "appIcon") ?? UIImage())
//    }
//}

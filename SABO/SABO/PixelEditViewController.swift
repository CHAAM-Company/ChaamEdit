//
//  PixelEditViewController.swift
//  SABO
//
//  Created by 이재웅 on 2022/10/09.
//

import SwiftUI
import BrightroomUI
import BrightroomEngine

// PixelEditingView
struct PixelEditingView: UIViewControllerRepresentable {
//    var image: UIImage
    var editindStack: EditingStack
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let pixelEditingViewController = PixelEditingViewController()
//        let imageProvider = ImageProvider(image: image)
        
        pixelEditingViewController.requestEditingStack(editindStack)
        
        return pixelEditingViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        // UIViewController를 업데이트 하고 싶을때
    }
}

class PixelEditingViewController: UIViewController {
    var controller: ClassicImageEditViewController?
    var editingStack: EditingStack?
    var imageProvider: ImageProvider?
    var image: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("일단 viewDidLoad 실행됨")
        controller = ClassicImageEditViewController(editingStack: editingStack!)
        
        let navigationController = UINavigationController(rootViewController: controller ?? UIViewController())
        
        self.present(navigationController, animated: true)
        print("프레젠트까지")
    }
    
    func requestImage(image: UIImage) {
         self.image = image
    }
    
    func requestImageProvider(_ provider: ImageProvider) {
        imageProvider = provider
    }
    
    func requestEditingStack(_ stack: EditingStack) {
        editingStack = stack
    }
}

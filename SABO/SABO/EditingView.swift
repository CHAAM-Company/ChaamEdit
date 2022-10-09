//
//  EditingView.swift
//  SABO
//
//  Created by 이재웅 on 2022/10/09.
//

import SwiftUI

struct EditingView: View {
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var cardVM: CardViewModel
    @EnvironmentObject var userVM: UserViewModel
    
    @State var editingExposure: Bool = false
    @State var editingContrast: Bool = false
    @State var editingTemperature: Bool = false
    @State var editingSaturation: Bool = false
    
    @State var exposureValue: Int = 0
    @State var contrastValue: Int = 0
    @State var temperatureValue: Int = 0
    @State var saturationValue: Int = 0
    
    @State var editedSetting = ""
    
    
    @Binding var image: UIImage
    let width = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            Image(uiImage: image)
                .resizable()
                .frame(width: width, height: width / 390 * 570)
                .aspectRatio(contentMode: .fit)
    
            if editingExposure {
                Text("\(editedSetting) 값 변경")
                Stepper(value: $exposureValue, in: -10...10) {
                    Text("\(exposureValue)")
                }
            } else if editingContrast {
                Text("\(editedSetting) 값 변경")
                Stepper(value: $contrastValue, in: -10...10) {
                    Text("\(contrastValue)")
                }
            } else if editingSaturation{
                Text("\(editedSetting) 값 변경")
                Stepper(value: $saturationValue, in: -10...10) {
                    Text("\(saturationValue)")
                }
            } else if editingTemperature {
                Text("\(editedSetting) 값 변경")
                Stepper(value: $temperatureValue, in: -10...10) {
                    Text("\(temperatureValue)")
                }
            } else {
                ControlView(editingExposure: $editingExposure, editingContrast: $editingContrast, editingTemperature: $editingTemperature, editingSaturation: $editingSaturation, editedSetting: $editedSetting)
            }
            
            if editingExposure || editingContrast || editingSaturation || editingTemperature {
                HStack {
                    Button {
                        editingExposure = false
                        editingContrast = false
                        editingTemperature = false
                        editingSaturation = false
                        
                        exposureValue = 0
                        contrastValue = 0
                        temperatureValue = 0
                        saturationValue = 0
                        
                        editedSetting = ""
                    } label: {
                        Text("취소")
                    }
                    
                    Button {
                        editingExposure = false
                        editingContrast = false
                        editingTemperature = false
                        editingSaturation = false
                        
                    } label: {
                        Text("입력완료")
                    }
                }
            }
            
            HStack {
                Spacer()
                
                Button {
                    // 등록하기 기능
                    cardVM.addCardData(title: "성공적인 색 보정 인가요?", originImage: image, fixedImage: image,
                                       calibrationValues: [Int(exposureValue), Int(contrastValue), Int(temperatureValue), Int(saturationValue)],
                                       userId: userVM.user?.id ?? "", userProfileImageUrl: userVM.user?.profileImageUrl ?? "")
                    dismiss()
                } label: {
                    Text("등록하기")
                        .bold()
                }
                .padding()
            }
        }
    }
}

//struct EditingView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditingView(image: UIImage(named: "appIcon") ?? UIImage())
//    }
//}

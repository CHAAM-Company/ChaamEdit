//
//  ControlView.swift
//  SABO
//
//  Created by 이재웅 on 2022/10/09.
//

import SwiftUI

struct ControlView: View {
    @Binding var editingExposure: Bool
    @Binding var editingContrast: Bool
    @Binding var editingTemperature: Bool
    @Binding var editingSaturation: Bool
    
    @Binding var editedSetting: String
    
    var body: some View {
        HStack {
            Button {
                editingExposure = true
                editedSetting = "노출"
            } label: {
                Image("Exposure")
            }
            .padding()
            
            Button {
                editingContrast = true
                editedSetting = "대비"
            } label: {
                Image("Contrast")
            }
            .padding()
            
            Button {
                editingTemperature = true
                editedSetting = "화이트밸런스"
            } label: {
                Image("temperature")
            }
            .padding()
            
            Button {
                editingSaturation = true
                editedSetting = "채도"
            } label: {
                Image("saturation")
            }
            .padding()
        }
    }
}

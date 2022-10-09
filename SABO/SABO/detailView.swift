//
//  detailView.swift
//  SABO
//
//  Created by 이창형 on 2022/10/08.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    var item: SABAModel
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                Rectangle()
                    .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
                    .ignoresSafeArea()
                    .frame(height: 260)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                
                HStack {
                    Text("\(item.title)")
                        .fontWeight(.bold)
                        .font(.system(size: 36))
                        .padding(.leading)
                    Image(uiImage: item.icon ?? UIImage())
                    Spacer()
                }
                
                VStack {
                    HStack {
                        Text("정의")
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                        Spacer()
                    }
                    
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .overlay {
                            Text("\(item.definition)")
                                .padding(.horizontal)
                        }
                        .frame(maxHeight: 100)
                    
                    Spacer()
                    
                    HStack {
                        Text("특징")
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                        Spacer()
                    }
                    
                    RoundedRectangle(cornerRadius: 16)
                        .foregroundColor(.white)
                        .padding(.horizontal)
                        .overlay {
                            Text("\(item.feature)")
                                .padding(.horizontal)
                                .padding(.horizontal)
                        }
                        .frame(maxHeight: 230)
                }
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
        }
        .navigationBarBackButtonHidden()
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(item: SABAModel(title: "채도", definition: "노출은 사진의 밝기를 나타냅니다.\n\n노출의 기본적인 원리는 카메라에 들어오는 빛의 양입니다.", feature: "채도는 이미지의 분위기를 좌우합니다.\n\n채도를 높이면 사진에 따라 차이가 있으나 선명도를 향상시킬 수 있습니다.\n\n하지만 과다하게 적용하면 사진의 세밀한 부분을 잃을 수 있습니다.\n\n반대로 채도가 너무 낮다면 무채색으로 사진이 변화합니다.",icon: UIImage(named: "saturation"), image: UIImage(named: "test")))
    }
}

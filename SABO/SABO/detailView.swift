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
                LoopingPlayer(videoName: item.videoName)
                    .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
                    .ignoresSafeArea()
                    .frame(height: 300)
                
                HStack {
                    Text("\(item.title)")
                        .fontWeight(.bold)
                        .font(.system(size: 36))
                        .padding(.leading)
                    Image(uiImage: item.icon ?? UIImage())
                    Spacer()
                }
                
                VStack() {
                    HStack {
                        Text("정의")
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                        Spacer()
                    }
                    
                    HStack {
                        Text(item.definition)
                            .padding(.all)
                        Spacer()
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: UIScreen.main.bounds.width - 37)
                            .foregroundColor(.white)
                    )
                    .padding(.horizontal)
                    
                    HStack {
                        Text("특징")
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                        Spacer()
                    }
                    
                    ScrollView() {
                        HStack {
                            Text(item.feature)
                                .padding(.all)
                            Spacer()
                        }
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 16)
                            .frame(width: UIScreen.main.bounds.width - 37)
                            .foregroundColor(.white)
                    )
                    .padding(.horizontal)
                }
                Spacer()
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
        DetailView(item: SABAModel(title: "노출", definition: "노출은 사진의 밝기를 나타냅니다.\n\n노출의 기본적인 원리는 카메라에 들어오는 빛의 양입니다.", feature: "노출도가 높을 시 주로 밝고 역동적으로 사진이 표현됩니다.\n\n노출도가 낮을 시 주로 어둡고 정적으로 사진이 나타납니다.", icon: UIImage(named: "Exposure"), videoName: "exposure"))
    }
}

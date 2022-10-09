//
//  MainCardViewModel.swift
//  SABO
//
//  Created by leejunmo on 2022/10/09.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage
import SwiftUI

class CardViewModel: ObservableObject {
    @Published var mainCards: [CardCell] = []
    @Published var userCards: [CardCell] = []
    
    private let db = Firestore.firestore()
    private let storage = Storage.storage()
    private var mainCardGridLastTime: Int = Int(Date().timeIntervalSince1970 * 1000)
    private var userCardGridLastTime: Int = Int(Date().timeIntervalSince1970 * 1000)
    
    // MARK: - 카드 Create
    func addCardData(title: String, originImage: UIImage, fixedImage: UIImage,
                     calibrationValues: [Int], userId: String, userProfileImageUrl: String) {
        let cardId = UUID().uuidString
        
        // 데이터 저장
        db.collection("cards").document(cardId).setData([
            "time": Int(Date().timeIntervalSince1970 * 1000),
            "title": title,
            "orginImageUrl": "images/\(userId)/\(cardId)/orgin.jpg",
            "fixedImageUrl": "images/\(userId)/\(cardId)/fixed.jpg",
            "resizedOriginImageUrl": "images/\(userId)/\(cardId)/resizedOrigin.jpg",
            "resizedFixedImageUrl": "images/\(userId)/\(cardId)/resizedFixed.jpg",
            "calibrationValues": calibrationValues,
            "creatorId": userId,
            "creatorProfileImageUrl": userProfileImageUrl
        ])
        
        DispatchQueue.main.async { [self] in
            // 이미지 리사이징
            let resizedOriginImage = resizeImage(image: originImage, targetSize: CGSizeMake(160.0, 160.0))
            let resizedFixedImage = resizeImage(image: fixedImage, targetSize: CGSizeMake(160.0, 160.0))
            guard resizedFixedImage != nil && resizedOriginImage != nil else {
                return
            }
            
            // 이미지 업로드
            let uploadImages = [
                "orgin": originImage,
                "fixed": fixedImage,
                "resizedOrigin": resizedOriginImage,
                "resizedFixed": resizedFixedImage
            ]
            for (type, image) in uploadImages {
                uploadImage(image: image!, userId: userId, cardId: cardId, type: type)
            }
        }
    }
    
    // MARK: - 카드 Read
    func fetchMainCardGrid(isRefresh: Bool=false) {
        let cardsRef = db.collection("cards")
        
        // 시간 설정
        if let lastTime = mainCards.last?.time {
            mainCardGridLastTime = lastTime
        } else {
            mainCardGridLastTime = Int(Date().timeIntervalSince1970 * 1000)
        }
        if isRefresh {
            mainCardGridLastTime = Int(Date().timeIntervalSince1970 * 1000)
        }
        
        cardsRef
            .order(by: "time", descending: true)
            .whereField("time", isLessThan: mainCardGridLastTime)
            .limit(to: 10)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    DispatchQueue.main.async { [self] in
                        for document in querySnapshot!.documents {
                            let data = document.data()
                            let cell = CardCell(
                                id: document.documentID,
                                time: data["time"] as? Int ?? 0,
                                title: data["title"] as? String ?? "",
                                orginImageUrl: data["orginImageUrl"] as? String ?? "",
                                fixedImageUrl: data["fixedImageUrl"] as? String ?? "",
                                resizedOrignImageUrl: data["resizedOriginImageUrl"] as? String ?? "",
                                resizedFixedImageUrl: data["resizedFixedImageUrl"] as? String ?? "",
                                calibrationValue: data["calibrationValues"] as? [Int] ?? [],
                                creatorId: data["creatorId"] as? String ?? "",
                                creatorProfileImageUrl: data["creatorProfileImageUrl"] as? String ?? ""
                            )
                            if cell.time < mainCardGridLastTime {
                                mainCards.append(cell)
                            }
                        }
                    }
                }
            }
    }
    
    func fetchUserCardGrid(userId: String) {
        let cardsRef = db.collection("cards")
        
        // 유저 그리드 초기화
        userCards = []
        
        cardsRef
            .order(by: "time", descending: true)
            .whereField("creatorId", isEqualTo: userId)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    DispatchQueue.main.async { [self] in
                        for document in querySnapshot!.documents {
                            let data = document.data()
                            let cell = CardCell(
                                id: document.documentID,
                                time: data["time"] as? Int ?? 0,
                                title: data["title"] as? String ?? "",
                                orginImageUrl: data["orginImageUrl"] as? String ?? "",
                                fixedImageUrl: data["fixedImageUrl"] as? String ?? "",
                                resizedOrignImageUrl: data["resizedOriginImageUrl"] as? String ?? "",
                                resizedFixedImageUrl: data["resizedFixedImageUrl"] as? String ?? "",
                                calibrationValue: data["calibrationValues"] as? [Int] ?? [],
                                creatorId: data["creatorId"] as? String ?? "",
                                creatorProfileImageUrl: data["creatorProfileImageUrl"] as? String ?? ""
                            )
                            userCards.append(cell)
                        }
                        print(userCards)
                    }
                }
            }
    }
    
    //MARK: - 카드 삭제
    func deleteCard(cardId: String) {
        db.collection("cards").document(cardId).delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
    
    // MARK: - 이미지 업로드 -> 이미지 URL 반환
    func uploadImage(image: UIImage, userId: String, cardId: String, type: String) {
        let storageRef = storage.reference()
        // UIImage -> Data
        let data = image.jpegData(compressionQuality: 0.8)
        
        // 참조 설정
        let filePath = "images/\(userId)/\(cardId)/\(type).jpg"
        let fileRef = storageRef.child(filePath)
        
        // 업로드
        let _ = fileRef.putData(data!, metadata: nil) { (metadata, error) in
            // 업로드 에러
            if error != nil {
                print("Error: 이미지 업로드 실패(\(filePath)")
            }
        }
    }
    
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(origin: .zero, size: newSize)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
}

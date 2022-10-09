//
//  UserViewModel.swift
//  SABO
//
//  Created by Wonhyuk Choi on 2022/10/09.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage
import SwiftUI

class UserViewModel: ObservableObject {
    @Published var user: User?
    @Published var userProfileImage: UIImage?
    
    private var db = Firestore.firestore()
    
    // MARK: - 유저 정보 Create
    func addUserData(uid: String, name: String, description: String) {
        db.collection("users").document(uid).setData([
            "name": name,
            "description": description
        ])
    }
    
    // MARK: - 유저 정보 Read
    func getUserData(uid: String) {
        db.collection("users").document(uid).addSnapshotListener { snapshot, error in
            if error == nil {
                if let snapshot = snapshot, snapshot.exists {
                    DispatchQueue.main.async {
                        let data = snapshot.data()
                        self.user = User(
                            id: uid,
                            name: data!["name"] as? String ?? "",
                            description: data!["description"] as? String ?? "",
                            profileImageUrl: data!["profileImageUrl"] as? String ?? ""
                        )
                    }
                } else {
                    // TODO: 첫 로그인 일 때
                }
            }
        }
    }
    
    // MARK: - 유저 정보 Update
    func updateUser(uid: String, info: [AnyHashable : Any]) {
        db.collection("users").document(uid).updateData(info) { error in
            if error == nil {
                self.getUserData(uid: uid)
            }
        }
    }
    
    // MARK: - 유저 정보 Delete
    func deleteData(userToDelete: User) {
        db.collection("users").document(userToDelete.id).delete { error in
            if let error = error {
                print("Error removing document: \(error)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
    
    // 프로필 이미지 업로드
    func uploadProfileImage(image: UIImage) {
        guard let user = self.user else { return }
        
        let storageRef = Storage.storage().reference()
        
        let imageData = image.jpegData(compressionQuality: 0.8)
        
        guard let data = imageData else { return }
        
        let path = "images/\(UUID().uuidString).jpeg"
        let fileRef = storageRef.child(path)
        
        _ = fileRef.putData(data, metadata: nil) { meta, error in
            if error == nil && meta != nil {
                self.updateUser(uid: user.id, info: ["profileImageUrl": path])
            }
        }
    }
    
    // 프로필 이미지 다운로드
    func retrieveProfileImage(user: User) {
        guard let path = user.profileImageUrl else { return }
        
        let storageRef = Storage.storage().reference()
        let fileRef = storageRef.child(path)
        fileRef.getData(maxSize: 5 * 640 * 640) { data, error in
            if error == nil && data != nil {
                if let image = UIImage(data: data!) {
                    DispatchQueue.main.async {
                        self.userProfileImage = image
                    }
                }
            }
        }
    }
}

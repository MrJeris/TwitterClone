//
//  AuthViewModel.swift
//  TwitterCloneSwiftUI
//
//  Created by MrJeris on 04.04.2023.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: Firebase.User?
    @Published var didAuthenticateUser = false
    private var tempUserSession: Firebase.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        print("DEBUG: User session is \(self.userSession?.uid)")
    }
    
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to sign in with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self.userSession = user
            
            print("DEBUG: Sign in user successfully")
            print("DEBUG: User is \(self.userSession)")
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            
            self.tempUserSession = user
            
            
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname,
                        "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { _ in
                    print("DEBUG: Did upload user data...")
                    self.didAuthenticateUser = true
                }
        }
    }
    
    func signOut() {
        //Устанавливается userSession = nil, для отображения экрана авторизации
        userSession = nil
        //Выход из аккаунта на сервере/бекенде (Firebase)
        try? Auth.auth().signOut()
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else { return }
        
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("user")
                .document(uid)
                .updateData(["profileImageUrl:": profileImageUrl]) { _ in
                    self.userSession = self.tempUserSession
                }
        }
    }
}

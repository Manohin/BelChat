//
//  Service.swift
//  BelChat
//
//  Created by Alexey Manokhin on 27.07.2023.
//

import UIKit
import Firebase
import FirebaseAuth

class Service {
    static let shared = Service()
    
    init() {}
    
    func createNewUser(_ data: LoginField, completion: @escaping (ResponceCode)->()) {
        Auth.auth().createUser(withEmail: data.email, password: data.password) { result, error in
            if error == nil {
                guard let result else { return }
                let userId = result.user.uid
                completion(ResponceCode(code: 1))
            } else {
                completion(ResponceCode(code: 0))
            }
        }
    }
}



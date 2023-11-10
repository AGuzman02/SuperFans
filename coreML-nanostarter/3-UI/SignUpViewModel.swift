//
//  SignUpViewModel.swift
//  coreML-nanostarter
//
//  Created by Concepción Hernández Flores on 09/11/23.
//

import Foundation
import SwiftUI
        
class SignUpViewModel : ObservableObject {
    
    struct RegisterUserModel : Decodable, Encodable {
        var username: String
        var password: String
    }

    func registerUser(username: String, password: String) async throws {
        guard let url = URL(string: "https://api-superfans.onrender.com/users") else {
            print("Invalid URL")
            return
        }
        
        let user = RegisterUserModel(username: username, password: password)
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = try? JSONEncoder().encode(user)

        let (_, response) = try await URLSession.shared.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            print("Error creating user")
            return
        }

        
    }
}

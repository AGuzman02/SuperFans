//
//  SignUpViewModel.swift
//  coreML-nanostarter
//
//  Created by Concepción Hernández Flores on 09/11/23.
//

import Foundation
import SwiftUI
        
class UpdateNameViewModel : ObservableObject {
    
    struct UpdateNameModel : Decodable, Encodable {
        var fname: String
    }

    func updateUser(name: String) async throws {
        guard let url = URL(string: "https://api-superfans.onrender.com/users/perfiles/1") else {
            print("Invalid URL")
            return
        }
        
        let user = UpdateNameModel(fname: name)
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "PUT"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = try? JSONEncoder().encode(user)

        let (_, response) = try await URLSession.shared.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            print("Error creating user")
            return
        }

        
    }
}


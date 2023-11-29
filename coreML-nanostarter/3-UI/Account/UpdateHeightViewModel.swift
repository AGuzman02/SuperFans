//
//  SignUpViewModel.swift
//  coreML-nanostarter
//
//  Created by Concepción Hernández Flores on 09/11/23.
//

import Foundation
import SwiftUI

//UPDATE (PUT) Erick y Jeannette
class UpdateHeightViewModel : ObservableObject {
    
    struct UpdateHeightModel : Decodable, Encodable {
        var height: Int
    }

    func updateUserHeight(height: Int) async throws {
        guard let url = URL(string: "https://api-superfans.onrender.com/users/perfiles/altura/1") else {
            print("Invalid URL")
            return
        }
        
        let user = UpdateHeightModel(height: height)
        
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



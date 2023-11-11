//
//  SignUpViewModel.swift
//  coreML-nanostarter
//
//  Created by Concepción Hernández Flores on 09/11/23.
//

import Foundation
import SwiftUI

//POST Erick y Jeannette
class LogInViewModel : ObservableObject {
    
    struct RegisterUserModel : Decodable, Encodable {
        var username: String
        var password: String
    }

    struct LoginResponse : Decodable, Encodable {
        var error: Int
        var data: Token
    }
    struct Token : Decodable, Encodable {
        var token: String
    }
    
    struct LoginResponseArray : Decodable {
        var responseLogin : [LoginResponse]
    }
    @Published var responseLogin = [LoginResponse]()
    //var responsetokenfinal : Any

    func loginUser(username: String, password: String) async throws {
        guard let url = URL(string: "https://api-superfans.onrender.com/auth/login/\(username)/\(password)") else {            print("Invalid URL")
            return
        }
        
        let user = RegisterUserModel(username: username, password: password)
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = try? JSONEncoder().encode(user)

        //let (_, response) = try await URLSession.shared.data(for: urlRequest)
        let(data, response) = try await URLSession.shared.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            print("Error logging user")
            return
        }
        
        ///
       // print(httpResponse.allHeaderFields["auth-token"])

        
        //print(data)
        
        let result = try JSONDecoder().decode(LoginResponse.self, from: data)
        
        print(result)
        DispatchQueue.main.async {
            //self.responseLogin = result
            print (result)
        }
        
        print (result)

        
    }
}

//
//  SignUpViewModel.swift
//  coreML-nanostarter
//
//  Created by Concepción Hernández Flores on 09/11/23.
//

import Foundation
import SwiftUI

/*class SessionManager: ObservableObject {
    static let shared = SessionManager()

    @Published var authToken: String?

    private init() {}
}*/


//POST Erick y Jeannette
class LogInViewModel : ObservableObject {
    @ObservedObject var sessionManager = SessionManager.shared

    struct RegisterUserModel : Decodable, Encodable {
        var username: String
        var pass: String
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
        guard let url = URL(string: "https://api-superfans.onrender.com/auth/login") else {            print("Invalid URL")
            return
        }
        
        let user = RegisterUserModel(username: username, pass: password)
        
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
        //let result = try JSONDecoder().decode(LoginResponse.self, from: data)
        
        do {
            let result = try JSONDecoder().decode(LoginResponse.self, from: data)
            print(result)
            
            let authToken = result.data.token  // Accede a la propiedad token dentro de la propiedad data
            
            if !authToken.isEmpty {
                print("JWT Token:", authToken)
                SessionManager.shared.authToken = authToken
                //sessionManager.authToken = authToken // Almacena el token en SessionManager
                // Aquí puedes hacer lo que quieras con el token, por ejemplo, almacenarlo para futuras solicitudes.
            } else {
                print("No se encontró el token en la respuesta.")
            }
        } catch {
            print("Error al decodificar la respuesta:", error)
        }

        
        //print(result)
        DispatchQueue.main.async {
            //self.responseLogin = result
            //print (result)
        }
        
        //print (result)

        
    }
}

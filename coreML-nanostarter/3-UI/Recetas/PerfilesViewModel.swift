//
//  PerfilesViewModel.swift
//  AppChistesJeannette
//
//  Created by Concepción Hernández Flores on 15/10/23.
//

import Foundation

import SwiftUI

class PerfilesViewModel : ObservableObject {
    @Published var perfil = [PerfilModel]()
    @Published var testIDPerfil = 1
    
    func getPerfilData() async throws
    {
        guard let url = URL(string: "https://api-superfans.onrender.com/users/perfiles/1")
        else{   //entra al else si la url es invalida
            print("invalid url")
            return
        }
        print(url)
        
        let urlRequest=URLRequest(url: url)
        
        let(data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard(response as? HTTPURLResponse)?.statusCode==200 else {
            print("error")
            return
        }
        
        let result = try JSONDecoder().decode(ResponseData2.self, from: data)
        
        print(result)
        DispatchQueue.main.async {
            self.perfil = result.perfil
        }
        print(url)
        print (result)
    }
}


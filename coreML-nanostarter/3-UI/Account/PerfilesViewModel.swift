//
//  PerfilesViewModel.swift
//  coreML-nanostarter
//
//  Created by Concepción Hernández Flores on 09/11/23.
//

import Foundation
import SwiftUI

//GET Erick y Jeannette
class PerfilesViewModel : ObservableObject {
    
    @Published var perfil = [PerfilModel]()
    @Published var testIDPerfil = 1
    
    func getPerfilData() async throws {
        guard let url = URL(string: "https://api-superfans.onrender.com/users/perfiles/\(testIDPerfil)") else {
            print("Invalid URL")
            return
        }
        let urlRequest=URLRequest(url: url)
        
        let(data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard(response as? HTTPURLResponse)?.statusCode==200 else {
            print("error")
            return
        }
        
        let result = try JSONDecoder().decode(SingleProfile.self, from: data)
        
        print(result)
        DispatchQueue.main.async {
            self.perfil = result.perfil
        }
        
        print (result)
        
    }
    
    func getTargetCal() -> Double{
        if perfil.first?.gender == true{
            return 66.47 + (13.75 * (perfil.first?.weight ?? 0)) + (5 * Double((perfil.first?.height ?? 0))) - (6.74 * Double((perfil.first?.age ?? 0)))
        } else {
            return 655.1 + (9.56 * (perfil.first?.weight ?? 0)) + (1.85 * Double((perfil.first?.height ?? 0))) - (4.68 * Double((perfil.first?.age ?? 0)))
        }
        
    }
}

//
//  PerfilesViewModel.swift
//  AppChistesJeannette
//
//  Created by Concepción Hernández Flores on 15/10/23.
//

import Foundation

import SwiftUI

class PasosViewModel : ObservableObject {
    @Published var arrPasos = [PasosModel]()
    @Published var idReceta = 59
    
    // IngredientesModel.swift
    //Ya quedo
    struct PasosModel: Decodable {
        var instruccion: String?
        var idreceta: Int
    }

    struct ResponsePasos: Decodable {
        var pasosReceta: [PasosModel]
    }
    
    
    
    func getPasos() async throws
    {
        guard let url = URL(string: "https://api-superfans.onrender.com/users/recetas/pasos/\(idReceta)")
        else{   //entra al else si la url es invalida
            print("invalid url")
            return
        }
        
        let urlRequest=URLRequest(url: url)
        
        let(data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard(response as? HTTPURLResponse)?.statusCode==200 else {
            print("error")
            return
        }
        
        let result = try JSONDecoder().decode(ResponsePasos.self, from: data)
        
        print(result)
        DispatchQueue.main.async {
            self.arrPasos = result.pasosReceta
        }
        
        print (result)
    }
}


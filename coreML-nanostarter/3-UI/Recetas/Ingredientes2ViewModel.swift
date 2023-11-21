//
//  PerfilesViewModel.swift
//  AppChistesJeannette
//
//  Created by Concepción Hernández Flores on 15/10/23.
//

import Foundation

import SwiftUI

class Ingredientes2ViewModel : ObservableObject {
    @Published var arrIngredientes2 = [Ingredientes2Model]()
    @Published var idReceta = 64
    
    // IngredientesModel.swift
    //Ya quedo
    struct Ingredientes2Model: Decodable, Hashable {
        var ingrediente: String
        var lsm: String?
        var idreceta: Int
    }
    struct ResponseDataIng: Decodable {
        var ingredientes: [Ingredientes2Model]
    }
    
    
    func getIngredientesData2(idreceta: Int) async throws
    {
        guard let url = URL(string: "https://api-superfans.onrender.com/users/recetas/ingredientes/\(idreceta)")
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
        
        let result = try JSONDecoder().decode(ResponseDataIng.self, from: data)
        
        print(result)
        DispatchQueue.main.async {
            self.arrIngredientes2 = result.ingredientes
        }
        
        print (result)
    }
}

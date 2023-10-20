//
//  PerfilesViewModel.swift
//  AppChistesJeannette
//
//  Created by Concepción Hernández Flores on 15/10/23.
//

import Foundation

import SwiftUI

class IngredientesViewModel : ObservableObject {
    @Published var arrIngredientes = [IngredientesModel]()
    
    func getIngredientesData() async throws
    {
        guard let url = URL(string: "https://api-superfans.onrender.com/ingredientes")
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
        
        let result = try JSONDecoder().decode(ResponseData.self, from: data)
        
        print(result)
        DispatchQueue.main.async {
            self.arrIngredientes = result.ingredientes
        }
        
        print (result)
    }
}
